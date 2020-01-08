//
//  AppAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import Swinject


// MARK: - AppAssembly

final class AppAssembly {
    
    // MARK: - Properties
    
    static let defaultAssembler: Assembler = {
        
        let assemblies: [Assembly] = []
            + flows
            + modules
        
        Container.loggingFunction = nil
        
        return Assembler(assemblies)
    }()
    
    static let resolver = defaultAssembler.resolver
}

extension AppAssembly {
    
    static let flows: [Assembly] = [
        AppCoordinatorAssembly(),
        ABListCoordinatorAssembly()
    ]
}

extension AppAssembly {
    
    static let modules: [Assembly] = [
        ABListModuleAssembly()
    ]
}
