//
//  ItemBLocalStorage.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import Foundation
import CoreData
import RxSwift

// MARK: - ItemBLocalStorage

final class ItemBLocalStorage {
    
    // MARK: Private properties
    
    private let provider: CoreDataProviderProtocol
    
    // MARK: Constructors
    
    init(provider: CoreDataProviderProtocol) {
        self.provider = provider
    }
}

extension ItemBLocalStorage: ItemBLocalStorageProtocol {
    
    func readAllItemB() -> Observable<[ItemBEntity]> {
        return Observable.create { [weak self] (observer) -> Disposable in
            guard
                let self = self
                else { observer.onCompleted(); return Disposables.create() }
            
            let context = self.provider.createChildContext()
            let itemBObjects = self.getAllItemB(context: context)
            let itemBEntities = itemBObjects.compactMap { self.mapItemBObjectToEntity($0) }
            
            observer.onNext(itemBEntities)
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    func readItemB(id: String) -> Observable<ItemBEntity?> {
        return Observable.create { [weak self] (observer) -> Disposable in
            guard
                let self = self
                else { observer.onCompleted(); return Disposables.create() }
            
            let context = self.provider.createChildContext()
            
            guard
                let itemBObject = self.getItemBObject(byId: id, context: context)
                else { observer.onNext(nil); observer.onCompleted(); return Disposables.create() }
            
            let itemBEntity = self.mapItemBObjectToEntity(itemBObject)
            
            observer.onNext(itemBEntity)
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    func createItemB(title: String, desc: String, value: Int, image: Data, labels: [String]) -> Observable<ItemBEntity?> {
        return Observable.create { [weak self] (observer) -> Disposable in
            guard
                let self = self
                else { observer.onCompleted(); return Disposables.create() }
            
            let context = self.provider.createChildContext()
            
            guard
                let ItemBObject = self.createItemBObject(title: title, desc: desc, value: value, image: image, labels: labels, context: context)
                else { observer.onNext(nil); observer.onCompleted(); return Disposables.create() }
            
            let ItemBEntity = self.mapItemBObjectToEntity(ItemBObject)
            
            observer.onNext(ItemBEntity)
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    func updateItemB(_ itemB: ItemBEntity) -> Observable<Void> {
        return Observable.create { [weak self] (observer) -> Disposable in
            guard
                let self = self
                else { observer.onCompleted(); return Disposables.create() }
            
            let context = self.provider.createChildContext()
            
            guard
                let itemBObject = self.getItemBObject(byId: itemB.id, context: context)
                else { observer.onNext(()); observer.onCompleted(); return Disposables.create() }
            
            self.mapItemBEntityToObject(entity: itemB, object: itemBObject)
            
            if let labelsOrderedSet = itemBObject.labels, let labelObjects = labelsOrderedSet.array as? [LabelCoreData] {
                self.provider.delete(labelObjects, in: context)
            }
            
            if let labelObjectDescription = self.provider.entity(entityName: LabelCoreData.entityName, context: context) {
                let labelObjects: [LabelCoreData] = itemB.labels.map { (label) in
                    let labelObject = LabelCoreData(entity: labelObjectDescription, insertInto: context)
                    labelObject.value = label
                    return labelObject
                }
                itemBObject.labels = NSOrderedSet(array: labelObjects)
            }
            
            try? context.save()
            self.provider.persist(synchronously: true, completion: nil)
            
            observer.onNext(())
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    func removeItemB(_ itemB: ItemBEntity) -> Observable<Void> {
        return Observable.empty()
    }
}

// MARK: - Helper functions

private extension ItemBLocalStorage {
    
    func getAllItemB(context: NSManagedObjectContext) -> [ItemBCoreData] {
        return provider.fetchObjects(entityName: ItemBCoreData.entityName, predicate: nil, sortDescriptors: nil, context: context)
    }
    
    func getItemBObject(byId id: String, context: NSManagedObjectContext) -> ItemBCoreData? {
        let predicate = NSPredicate(format: "id == %@", id)
        return provider.fetchObject(entityName: ItemBCoreData.entityName, predicate: predicate, sortDescriptors: nil, context: context)
    }
    
    func mapItemBObjectToEntity(_ object: ItemBCoreData) -> ItemBEntity? {
        guard
            let id = object.id,
            let title = object.title,
            let desc = object.desc,
            let value = object.value?.intValue,
            let image = object.image as Data?,
            let labelObjects = object.labels?.array as? [LabelCoreData],
            let labels = mapLabelObjectsToEntity(labelObjects)
            else { return nil }
        return ItemBEntity(id: id, title: title, desc: desc, value: value, image: image, labels: labels)
    }
    
    func mapLabelObjectsToEntity(_ objects: [LabelCoreData]) -> [String]? {
        var labels = [String]()
        
        for object in objects {
            guard
                let label = object.value
                else { return nil }
            labels.append(label)
        }
        
        return labels
    }
    
    func mapItemBEntityToObject(entity: ItemBEntity, object: ItemBCoreData) {
        object.title = entity.title
        object.desc = entity.desc
        object.value = NSNumber(value: entity.value)
        object.image = entity.image as NSData
    }
    
    func createItemBObject(title: String, desc: String, value: Int, image: Data, labels: [String], context: NSManagedObjectContext) -> ItemBCoreData? {
        guard
            let itemBObjectDescription = provider.entity(entityName: ItemBCoreData.entityName, context: context),
            let labelObjectDescription = provider.entity(entityName: LabelCoreData.entityName, context: context)
            else { return nil }
        
        let itemBObject = ItemBCoreData(entity: itemBObjectDescription, insertInto: context)
        
        itemBObject.id = generateId()
        itemBObject.title = title
        itemBObject.desc = desc
        itemBObject.value = NSNumber(value: value)
        itemBObject.image = image as NSData
        
        let labelObjects: [LabelCoreData] = labels.map { (label) in
            let labelObject = LabelCoreData(entity: labelObjectDescription, insertInto: context)
            labelObject.value = label
            return labelObject
        }
        
        itemBObject.labels = NSOrderedSet(array: labelObjects)
        
        try? context.save()
        provider.persist(synchronously: true, completion: nil)
        
        return itemBObject
    }
    
    func generateId() -> String   {
        return UUID().uuidString
    }
}
