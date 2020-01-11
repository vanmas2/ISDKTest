//
//  CoreDataProviderProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation
import CoreData


protocol CoreDataProviderProtocol {
    var mainContext: NSManagedObjectContext { get }
    func entity<T>(for type: T.Type, context: NSManagedObjectContext) -> NSEntityDescription?
    func entity(entityName: String, context: NSManagedObjectContext) -> NSEntityDescription?
    func persist(synchronously: Bool, completion: ((NSError?) -> Void)?)
    func delete(_ objects: [NSManagedObject], in context: NSManagedObjectContext)
    func fetchObjects<T: NSManagedObject>(entityName: String, predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?, context: NSManagedObjectContext) -> [T]
    func fetchObject<T: NSManagedObject>(entityName: String, predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?, context: NSManagedObjectContext) -> T?
    func createChildContext() -> NSManagedObjectContext
}
