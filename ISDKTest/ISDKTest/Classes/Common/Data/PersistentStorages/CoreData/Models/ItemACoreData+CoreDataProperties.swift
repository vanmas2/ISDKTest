//
//  ItemACoreData+CoreDataProperties.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//
//

import Foundation
import CoreData


extension ItemACoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemACoreData> {
        return NSFetchRequest<ItemACoreData>(entityName: "ItemA")
    }


}
