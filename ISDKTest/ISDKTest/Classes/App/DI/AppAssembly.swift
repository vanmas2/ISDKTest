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
            + useCases
            + repositories
            + persistentStorages
        
        Container.loggingFunction = nil
        
        return Assembler(assemblies)
    }()
    
    static let resolver = defaultAssembler.resolver
}

extension AppAssembly {
    
    static let flows: [Assembly] = [
        AppCoordinatorAssembly(),
        ABListCoordinatorAssembly(),
        ItemACoordinatorAssembly(),
        ItemBCoordinatorAssembly(),
        CreateItemACoordinatorAssembly(),
        CreateItemBCoordinatorAssembly()
    ]
}

extension AppAssembly {
    
    static let modules: [Assembly] = [
        ABListModuleAssembly(),
        ItemAModuleAssembly(),
        ItemBModuleAssembly(),
        CreateItemAModuleAssembly(),
        CreateItemBModuleAssembly()
    ]
}

extension AppAssembly {
    
    static let useCases: [Assembly] = [
        GetABListUseCaseAssembly(),
        CreateItemAUseCaseAssembly(),
        GetItemAUseCaseAssembly(),
        UpdateItemAUseCaseAssembly()
    ]
}

extension AppAssembly {
    
    static let repositories: [Assembly] = [
        ItemARepositoryAssembly(),
        ItemBRepositoryAssembly()
    ]
}

extension AppAssembly {
    
    static let persistentStorages: [Assembly] = [
        CoreDataProviderAssembly()
    ]
}
