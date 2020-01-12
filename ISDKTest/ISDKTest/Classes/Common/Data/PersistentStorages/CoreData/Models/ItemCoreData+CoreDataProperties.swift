//
//  ItemCoreData+CoreDataProperties.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//
//

import Foundation
import CoreData


extension ItemCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemCoreData> {
        return NSFetchRequest<ItemCoreData>(entityName: "Item")
    }

    @NSManaged public var desc: String?
    @NSManaged public var id: String?
    @NSManaged public var image: NSData?
    @NSManaged public var title: String?
    @NSManaged public var value: NSNumber?

}
