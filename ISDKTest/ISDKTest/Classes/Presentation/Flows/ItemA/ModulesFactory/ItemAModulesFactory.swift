//
//  ItemAModulesFactory.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation


// MARK: - ItemAModulesFactory

class ItemAModulesFactory {
    
    // MARK: - Properties
    
    private var module: (String?) -> ItemAModuleProtocol
    
    // MARK: - Construction
    
    init(module: @escaping (String?) -> ItemAModuleProtocol) {
        self.module = module
    }
}


// MARK: - ItemAModulesFactoryProtocol

extension ItemAModulesFactory: ItemAModulesFactoryProtocol {
    
    func createItemAModule(id: String?) -> ItemAModuleProtocol {
        return module(id)
    }
}
