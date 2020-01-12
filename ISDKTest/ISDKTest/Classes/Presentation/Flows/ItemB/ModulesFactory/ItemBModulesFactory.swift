//
//  ItemBModulesFactory.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation


// MARK: - ItemBModulesFactory

class ItemBModulesFactory {
    
    // MARK: - Properties
    
    private var module: (String) -> ItemBModuleProtocol
    
    // MARK: - Construction
    
    init(module: @escaping (String) -> ItemBModuleProtocol) {
        self.module = module
    }
}


// MARK: - ItemBModulesFactoryProtocol

extension ItemBModulesFactory: ItemBModulesFactoryProtocol {
    
    func createItemBModule(id: String) -> ItemBModuleProtocol {
        return module(id)
    }
}
