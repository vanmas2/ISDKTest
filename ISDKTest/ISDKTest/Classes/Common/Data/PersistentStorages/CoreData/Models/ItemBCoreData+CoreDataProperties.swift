//
//  ItemBCoreData+CoreDataProperties.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//
//

import Foundation
import CoreData


extension ItemBCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemBCoreData> {
        return NSFetchRequest<ItemBCoreData>(entityName: "ItemB")
    }

    @NSManaged public var labels: NSOrderedSet?

}

// MARK: Generated accessors for labels
extension ItemBCoreData {

    @objc(insertObject:inLabelsAtIndex:)
    @NSManaged public func insertIntoLabels(_ value: LabelCoreData, at idx: Int)

    @objc(removeObjectFromLabelsAtIndex:)
    @NSManaged public func removeFromLabels(at idx: Int)

    @objc(insertLabels:atIndexes:)
    @NSManaged public func insertIntoLabels(_ values: [LabelCoreData], at indexes: NSIndexSet)

    @objc(removeLabelsAtIndexes:)
    @NSManaged public func removeFromLabels(at indexes: NSIndexSet)

    @objc(replaceObjectInLabelsAtIndex:withObject:)
    @NSManaged public func replaceLabels(at idx: Int, with value: LabelCoreData)

    @objc(replaceLabelsAtIndexes:withLabels:)
    @NSManaged public func replaceLabels(at indexes: NSIndexSet, with values: [LabelCoreData])

    @objc(addLabelsObject:)
    @NSManaged public func addToLabels(_ value: LabelCoreData)

    @objc(removeLabelsObject:)
    @NSManaged public func removeFromLabels(_ value: LabelCoreData)

    @objc(addLabels:)
    @NSManaged public func addToLabels(_ values: NSOrderedSet)

    @objc(removeLabels:)
    @NSManaged public func removeFromLabels(_ values: NSOrderedSet)

}
