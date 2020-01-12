//
//  ItemBModulesFactoryProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation


protocol ItemBModulesFactoryProtocol: class {
    func createItemBModule(id: String?) -> ItemBModuleProtocol
}
