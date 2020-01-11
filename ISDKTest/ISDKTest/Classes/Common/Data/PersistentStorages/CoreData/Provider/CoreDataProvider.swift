//
//  CoreDataProvider.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation
import CoreData


public enum PersistentStoreType {
    
    /// Represents the value for NSSQLiteStoreType.
    case sqLite
    
    /// Represents the value for NSBinaryStoreType.
    case binary
    
    /// Represents the value for NSInMemoryStoreType.
    case inMemory
    
    /// Value of the Core Data string constants corresponding to each case.
    var stringValue: String {
        switch self {
        case .sqLite:
            return NSSQLiteStoreType
        case .binary:
            return NSBinaryStoreType
        case .inMemory:
            return NSInMemoryStoreType
        }
    }
}

// MARK: - Logger
/**
 *  Defines requirements for a logger that CoreDataProvider can use to log errors.
 */
public protocol CoreDataProviderErrorLogger {
    
    /**
     This method is called when CoreDataProvider catches a thrown error internally. Custom loggers may have this method print to the console or write to a file.
     
     - parameter error:    The error that was thrown.
     - parameter file:     The file from which the error logging method was called from.
     - parameter function: The function from which the error logging method was called from.
     - parameter line:     The line number in the file from which the error logging method was called from.
     */
    func log(error: NSError, file: StaticString, function: StaticString, line: UInt)
}

// MARK: - DefaultLogger
private class DefaultLogger: CoreDataProviderErrorLogger {
    
    func log(error: NSError, file: StaticString, function: StaticString, line: UInt) {
        
        print("[CoreDataProvider - \(function) line \(line)] Error: \(error.localizedDescription)")
    }
}

// MARK: - Constants
private struct Constants {
    
    static fileprivate let mustCallSetupMethodErrorMessage = "CoreDataProvider must be set up using setUp(withDataModelName:bundle:persistentStoreType:) before it can be used."
}

// MARK: - CoreDataProvider
/**
 Responsible for setting up the Core Data stack. Also provides some convenience methods for fetching, deleting, and saving.
 */
public final class CoreDataProvider {
    
    // MARK: - Properties
    
    private let dataModelName: String
    
    private let dataModelBundle: Bundle
    
    private let persistentStoreName: String
    
    private let persistentStoreType: PersistentStoreType
    
    /// The logger to use for logging errors caught internally. A default logger is used if a custom one isn't provided. Assigning nil to this property prevents CoreDataProvider from emitting any logs to the console.
    private var errorLogger: CoreDataProviderErrorLogger? = DefaultLogger()
    
    /// The value to use for `fetchBatchSize` when fetching objects.
    private var defaultFetchBatchSize = 50
    
    // MARK: - Constructors
    
    /**
     This method must be called before CoreDataProvider can be used. It provides CoreDataProvider with the required information for setting up the Core Data stack. Call this in application(_:didFinishLaunchingWithOptions:).
     
     - parameter dataModelName:       The name of the data model schema file.
     - parameter bundle:              The bundle in which the data model schema file resides.
     - parameter persistentStoreName: The name of the persistent store.
     - parameter persistentStoreType: The persistent store type. Defaults to SQLite.
     */
    init(withDataModelName dataModelName: String, bundle: Bundle, persistentStoreName: String, persistentStoreType: PersistentStoreType = .sqLite) {
        self.dataModelName = dataModelName
        self.dataModelBundle = bundle
        self.persistentStoreName = persistentStoreName
        self.persistentStoreType = persistentStoreType
    }
    
    // MARK: - Lazy properties
    
    lazy private var applicationDocumentsDirectory: URL = {
        guard
            let containerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "ru.vanmas2.ISDKTest")
            else { return URL(fileURLWithPath: "") }
        return containerURL
    }()
    
    lazy private var managedObjectModel: NSManagedObjectModel = {
        
        guard
            let modelURL = dataModelBundle.url(forResource: dataModelName, withExtension: "momd")
            else { fatalError("Failed to locate data model schema file.") }
        
        guard
            let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL)
            else { fatalError("Failed to created managed object model") }
        
        return managedObjectModel
    }()
    
    lazy private var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let url = URL(fileURLWithPath: documentsPath.appending("/\(persistentStoreName).sqlite"))//applicationDocumentsDirectory.appendingPathComponent("\(persistentStoreName).sqlite")
        
        let options = [
            NSMigratePersistentStoresAutomaticallyOption: true,
            NSInferMappingModelAutomaticallyOption: true
        ]
        
        do {
            try coordinator.addPersistentStore(ofType: persistentStoreType.stringValue, configurationName: nil, at: url, options: options)
        } catch let error as NSError {
            fatalError("Failed to initialize the application's persistent data: \(error.localizedDescription)")
        } catch {
            fatalError("Failed to initialize the application's persistent data")
        }
        
        return coordinator
    }()
    
    lazy private var privateContext: NSManagedObjectContext = {
        
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.persistentStoreCoordinator = persistentStoreCoordinator
        return context
    }()
    
    /// A MainQueueConcurrencyType context whose parent is a PrivateQueueConcurrencyType context. The PrivateQueueConcurrencyType context is the root context.
    lazy var mainContext: NSManagedObjectContext = {
        
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.parent = privateContext
        return context
    }()
}

extension CoreDataProvider: CoreDataProviderProtocol {
    
    // MARK: - Child Contexts
    
    /**
     Creates a private queue concurrency type context that is the child of the specified parent context.
     
     - parameter parentContext: The context to act as the parent of the returned context.
     
     - returns: A private queue concurrency type context that is the child of the specified parent context.
     */
    func createChildContext(withParent parent: NSManagedObjectContext) -> NSManagedObjectContext {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        managedObjectContext.parent = parent
        return managedObjectContext
    }
    
    func createChildContext() -> NSManagedObjectContext {
        return createChildContext(withParent: mainContext)
    }
    
    // MARK: - Fetching
    
    /**
     This is a convenience method for performing a fetch request. Note: Errors thrown by executeFetchRequest are suppressed and logged in order to make usage less verbose. If detecting thrown errors is needed in your use case, you will need to use Core Data directly.
     
     - parameter entity:          The NSManagedObject subclass to be fetched.
     - parameter predicate:       A predicate to use for the fetch if needed (defaults to nil).
     - parameter sortDescriptors: Sort descriptors to use for the fetch if needed (defaults to nil).
     - parameter context:         The NSManagedObjectContext to perform the fetch with.
     
     - returns: A typed array containing the results. If executeFetchRequest throws an error, an empty array is returned.
     */
    func fetchObjects<T: NSManagedObject>(entity: T.Type, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil, context: NSManagedObjectContext) -> [T] {
        
        let request = NSFetchRequest<T>(entityName: String(describing: entity))
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        request.fetchBatchSize = defaultFetchBatchSize
        
        do {
            return try context.fetch(request)
        } catch let error as NSError {
            log(error: error)
            return [T]()
        }
    }
    
    func fetchObjects<T: NSManagedObject>(entityName: String, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil, context: NSManagedObjectContext) -> [T] {
        
        let request = NSFetchRequest<T>(entityName: entityName)
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        request.fetchBatchSize = defaultFetchBatchSize
        
        do {
            return try context.fetch(request)
        } catch let error as NSError {
            log(error: error)
            return [T]()
        }
    }
    
    /**
     This is a convenience method for performing a fetch request that fetches a single object. Note: Errors thrown by executeFetchRequest are suppressed and logged in order to make usage less verbose. If detecting thrown errors is needed in your use case, you will need to use Core Data directly.
     
     - parameter entity:          The NSManagedObject subclass to be fetched.
     - parameter predicate:       A predicate to use for the fetch if needed (defaults to nil).
     - parameter sortDescriptors: Sort descriptors to use for the fetch if needed (defaults to nil).
     - parameter context:         The NSManagedObjectContext to perform the fetch with.
     
     - returns: A typed result if found. If executeFetchRequest throws an error, nil is returned.
     */
    func fetchObject<T: NSManagedObject>(entity: T.Type, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil, context: NSManagedObjectContext) -> T? {
        
        let request = NSFetchRequest<T>(entityName: String(describing: entity))
        
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        request.fetchLimit = 1
        
        do {
            return try context.fetch(request).first
        } catch let error as NSError {
            log(error: error)
            return nil
        }
    }
    
    func fetchObject<T: NSManagedObject>(entityName: String, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil, context: NSManagedObjectContext) -> T? {
        
        let request = NSFetchRequest<T>(entityName: entityName)
        
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        request.fetchLimit = 1
        
        do {
            return try context.fetch(request).first
        } catch let error as NSError {
            log(error: error)
            return nil
        }
    }
    
    // MARK: - Deleting
    
    /**
     Iterates over the objects and deletes them using the supplied context.
     
     - parameter objects: The objects to delete.
     - parameter context: The context to perform the deletion with.
     */
    func delete(_ objects: [NSManagedObject], in context: NSManagedObjectContext) {
        
        for object in objects {
            context.delete(object)
        }
    }
    
    /**
     For each entity in the model, fetches all objects into memory, iterates over each object and deletes them using the main context. Note: Errors thrown by executeFetchRequest are suppressed and logged in order to make usage less verbose. If detecting thrown errors is needed in your use case, you will need to use Core Data directly.
     */
    func deleteAllObjects() {
        
        for entityName in managedObjectModel.entitiesByName.keys {
            
            let request = NSFetchRequest<NSManagedObject>(entityName: entityName)
            request.includesPropertyValues = false
            
            do {
                for object in try mainContext.fetch(request) {
                    mainContext.delete(object)
                }
            } catch let error as NSError {
                log(error: error)
            }
        }
    }
    
    // MARK: - Saving
    
    /**
     Saves changes to the persistent store.
     
     - parameter synchronously: Whether the main thread should block while writing to the persistent store or not.
     - parameter completion:    Called after the save on the private context completes. If there is an error, it is called immediately and the error parameter is populated.
     */
    func persist(synchronously: Bool, completion: ((NSError?) -> Void)? = nil) {
        
        var mainContextSaveError: NSError?
        
        if mainContext.hasChanges {
            mainContext.performAndWait {
                do {
                    try self.mainContext.save()
                } catch var error as NSError {
                    mainContextSaveError = error
                }
            }
        }
        
        guard mainContextSaveError == nil else {
            completion?(mainContextSaveError)
            return
        }
        
        func savePrivateContext() {
            do {
                try privateContext.save()
                completion?(nil)
            } catch let error as NSError {
                completion?(error)
            }
        }
        
        if privateContext.hasChanges {
            if synchronously {
                privateContext.performAndWait(savePrivateContext)
            } else {
                privateContext.perform(savePrivateContext)
            }
        }
    }
    
    // MARK: - Logging
    
    func log(error: NSError, file: StaticString = #file, function: StaticString = #function, line: UInt = #line) {
        
        errorLogger?.log(error: error, file: file, function: function, line: line)
    }
    
    // MARK: - Entity for Name
    
    func entity<T>(for type: T.Type, context: NSManagedObjectContext) -> NSEntityDescription? {
        let name = String(describing: type)
        return NSEntityDescription.entity(forEntityName: name, in: context)
    }
    
    func entity(entityName: String, context: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: entityName, in: context)
    }
}

