//
//  ItemACoreData+CoreDataProperties.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//
//

import Foundation
import CoreData


extension ItemACoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemACoreData> {
        return NSFetchRequest<ItemACoreData>(entityName: "ItemA")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var value: NSNumber?
    @NSManaged public var image: NSData?

}
