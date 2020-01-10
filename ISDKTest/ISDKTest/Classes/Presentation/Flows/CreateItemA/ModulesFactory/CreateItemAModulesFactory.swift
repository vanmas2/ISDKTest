//
//  CreateItemAModulesFactory.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation


// MARK: - CreateItemAModulesFactory

class CreateItemAModulesFactory {
    
    // MARK: - Properties
    
    private var module: () -> CreateItemAModuleProtocol
    
    // MARK: - Construction
    
    init(module: @escaping () -> CreateItemAModuleProtocol) {
        self.module = module
    }
}


// MARK: - CreateItemAModulesFactoryProtocol

extension CreateItemAModulesFactory: CreateItemAModulesFactoryProtocol {
    
    func createCreateItemAModule() -> CreateItemAModuleProtocol {
        return module()
    }
}
