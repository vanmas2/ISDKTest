//
//  ItemALocalStorage.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation
import CoreData
import RxSwift

// MARK: - ItemALocalStorage

final class ItemALocalStorage {
    
    // MARK: Private properties
    
    private let provider: CoreDataProviderProtocol
    
    // MARK: Constructors
    
    init(provider: CoreDataProviderProtocol) {
        self.provider = provider
    }
}

extension ItemALocalStorage: ItemALocalStorageProtocol {
    
    func readAllItemA() -> Observable<[ItemAEntity]> {
        return Observable.create { [weak self] (observer) -> Disposable in
            guard
                let self = self
                else { observer.onCompleted(); return Disposables.create() }
            
            let context = self.provider.createChildContext()
            let itemAObjects = self.getAllItemA(context: context)
            let itemAEntities = itemAObjects.compactMap { self.mapItemAObjectToEntity($0) }
            
            observer.onNext(itemAEntities)
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    func readItemA(id: String) -> Observable<ItemAEntity?> {
        return Observable.create { [weak self] (observer) -> Disposable in
            guard
                let self = self
                else { observer.onCompleted(); return Disposables.create() }
            
            let context = self.provider.createChildContext()
            
            guard
                let itemAObject = self.getItemAObject(byId: id, context: context)
                else { observer.onNext(nil); observer.onCompleted(); return Disposables.create() }
            
            let itemAEntity = self.mapItemAObjectToEntity(itemAObject)
            
            observer.onNext(itemAEntity)
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    func createItemA(title: String, desc: String, value: Int, image: Data) -> Observable<ItemAEntity?> {
        return Observable.create { [weak self] (observer) -> Disposable in
            guard
                let self = self
                else { observer.onCompleted(); return Disposables.create() }
            
            let context = self.provider.createChildContext()
            
            guard
                let itemAObject = self.createItemAObject(title: title, desc: desc, value: value, image: image, context: context)
                else { observer.onNext(nil); observer.onCompleted(); return Disposables.create() }
            
            let itemAEntity = self.mapItemAObjectToEntity(itemAObject)
            
            observer.onNext(itemAEntity)
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    func updateItemA(_ itemA: ItemAEntity) -> Observable<Void> {
        return Observable.create { [weak self] (observer) -> Disposable in
            guard
                let self = self
                else { observer.onCompleted(); return Disposables.create() }
            
            let context = self.provider.createChildContext()
            
            guard
                let itemAObject = self.getItemAObject(byId: itemA.id, context: context)
                else { observer.onNext(()); observer.onCompleted(); return Disposables.create() }
            
            self.mapItemAEntityToObject(entity: itemA, object: itemAObject)
            
            try? context.save()
            self.provider.persist(synchronously: true, completion: nil)
            
            observer.onNext(())
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    func removeItemA(_ itemA: ItemAEntity) -> Observable<Void> {
        return Observable.empty()
    }
}

// MARK: - Helper functions

private extension ItemALocalStorage {
    
    func getAllItemA(context: NSManagedObjectContext) -> [ItemACoreData] {
        return provider.fetchObjects(entityName: ItemACoreData.entityName, predicate: nil, sortDescriptors: nil, context: context)
    }
    
    func getItemAObject(byId id: String, context: NSManagedObjectContext) -> ItemACoreData? {
        let predicate = NSPredicate(format: "id == %@", id)
        return provider.fetchObject(entityName: ItemACoreData.entityName, predicate: predicate, sortDescriptors: nil, context: context)
    }
    
    func mapItemAObjectToEntity(_ object: ItemACoreData) -> ItemAEntity? {
        guard
            let id = object.id,
            let title = object.title,
            let desc = object.desc,
            let value = object.value?.intValue,
            let image = object.image as Data?
            else { return nil }
        return ItemAEntity(id: id, title: title, desc: desc, value: value, image: image)
    }
    
    func mapItemAEntityToObject(entity: ItemAEntity, object: ItemACoreData) {
        object.title = entity.title
        object.desc = entity.desc
        object.value = NSNumber(value: entity.value)
        object.image = entity.image as NSData
    }
    
    func createItemAObject(title: String, desc: String, value: Int, image: Data, context: NSManagedObjectContext) -> ItemACoreData? {
        guard
            let itemAObjectDescription = provider.entity(entityName: ItemACoreData.entityName, context: context)
            else { return nil }
        
        let itemAObject = ItemACoreData(entity: itemAObjectDescription, insertInto: context)
        
        itemAObject.id = generateId()
        itemAObject.title = title
        itemAObject.desc = desc
        itemAObject.value = NSNumber(value: value)
        itemAObject.image = image as NSData
        
        try? context.save()
        provider.persist(synchronously: true, completion: nil)
        
        return itemAObject
    }
    
    func generateId() -> String   {
        return UUID().uuidString
    }
}
