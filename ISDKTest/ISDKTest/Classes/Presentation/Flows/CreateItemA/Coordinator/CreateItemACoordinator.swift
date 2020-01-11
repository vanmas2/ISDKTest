//
//  CreateItemACoordinator.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation


// MARK: - CreateItemACoordinator

final class CreateItemACoordinator: Coordinator, CreateItemACoordinatorProtocol {
    
    // MARK: Properties
    
    private let coordinatorsFactory: CreateItemACoordinatorsFactoryProtocol
    
    private let modulesFactory: CreateItemAModulesFactoryProtocol
    
    // MARK: Constructors
    
    init(coordinatorsFactory: CreateItemACoordinatorsFactoryProtocol, modulesFactory: CreateItemAModulesFactoryProtocol, router: RouterProtocol) {
        self.coordinatorsFactory = coordinatorsFactory
        self.modulesFactory = modulesFactory
        super.init(router: router)
    }
    
    // MARK: Override functions
    
    override func start() {
        showCreateItemAModule()
    }
}

// MARK: - Modules

private extension CreateItemACoordinator {
    
    func showCreateItemAModule() {
        var module = modulesFactory.createCreateItemAModule()
        
        module.output.didFinish = { [weak self] in
            self?.router.popModule()
            self?.finishFlow?()
        }
        
        router.push(module, animated: true) { [weak self] in
            self?.finishFlow?()
        }
    }
}

