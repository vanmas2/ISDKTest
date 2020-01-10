//
//  CreateItemBCoordinator.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation


// MARK: - CreateItemBCoordinator

final class CreateItemBCoordinator: Coordinator, CreateItemBCoordinatorProtocol {
    
    // MARK: Properties
    
    private let coordinatorsFactory: CreateItemBCoordinatorsFactoryProtocol
    
    private let modulesFactory: CreateItemBModulesFactoryProtocol
    
    // MARK: Constructors
    
    init(coordinatorsFactory: CreateItemBCoordinatorsFactoryProtocol, modulesFactory: CreateItemBModulesFactoryProtocol, router: RouterProtocol) {
        self.coordinatorsFactory = coordinatorsFactory
        self.modulesFactory = modulesFactory
        super.init(router: router)
    }
    
    // MARK: Override functions
    
    override func start() {
        showCreateItemBModule()
    }
}

// MARK: - Modules

private extension CreateItemBCoordinator {
    
    func showCreateItemBModule() {
        var module = modulesFactory.createCreateItemBModule()
        
        module.output.didFinish = { [weak self] in
            
        }
        
        router.push(module)
    }
}

