//
//  LabelCoreData+CoreDataProperties.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//
//

import Foundation
import CoreData


extension LabelCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LabelCoreData> {
        return NSFetchRequest<LabelCoreData>(entityName: "Label")
    }

    @NSManaged public var value: String?
    @NSManaged public var itemB: ItemBCoreData?

}
