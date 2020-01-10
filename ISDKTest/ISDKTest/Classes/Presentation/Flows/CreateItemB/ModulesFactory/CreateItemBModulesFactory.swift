//
//  CreateItemBModulesFactory.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation


// MARK: - CreateItemBModulesFactory

class CreateItemBModulesFactory {
    
    // MARK: - Properties
    
    private var module: () -> CreateItemBModuleProtocol
    
    // MARK: - Construction
    
    init(module: @escaping () -> CreateItemBModuleProtocol) {
        self.module = module
    }
}


// MARK: - CreateItemBModulesFactoryProtocol

extension CreateItemBModulesFactory: CreateItemBModulesFactoryProtocol {
    
    func createCreateItemBModule() -> CreateItemBModuleProtocol {
        return module()
    }
}
