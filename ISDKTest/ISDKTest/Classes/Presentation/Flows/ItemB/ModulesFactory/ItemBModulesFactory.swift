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
    
    private var module: () -> ItemBModuleProtocol
    
    // MARK: - Construction
    
    init(module: @escaping () -> ItemBModuleProtocol) {
        self.module = module
    }
}


// MARK: - ItemBModulesFactoryProtocol

extension ItemBModulesFactory: ItemBModulesFactoryProtocol {
    
    func createItemBModule() -> ItemBModuleProtocol {
        return module()
    }
}
