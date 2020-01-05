//
//  ABListModulesFactory.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import Foundation


// MARK: - ABListModulesFactory

class ABListModulesFactory {
    
    // MARK: - Properties
    
    private var abListModule: () -> ABListModuleProtocol
    
    // MARK: - Construction
    
    init(abListModule: @escaping () -> ABListModuleProtocol) {
        self.abListModule = abListModule
    }
}


// MARK: - ABListModulesFactoryProtocol

extension ABListModulesFactory: ABListModulesFactoryProtocol {
    
    func createABListModule() -> ABListModuleProtocol {
        return abListModule()
    }
}
