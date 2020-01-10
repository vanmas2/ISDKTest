//
//  ItemACoordinator.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation


// MARK: - ItemACoordinator

final class ItemACoordinator: Coordinator, ItemACoordinatorProtocol {
    
    // MARK: Properties
    
    private let coordinatorsFactory: ItemACoordinatorsFactoryProtocol
    
    private let modulesFactory: ItemAModulesFactoryProtocol
    
    // MARK: Constructors
    
    init(coordinatorsFactory: ItemACoordinatorsFactoryProtocol, modulesFactory: ItemAModulesFactoryProtocol, router: RouterProtocol) {
        self.coordinatorsFactory = coordinatorsFactory
        self.modulesFactory = modulesFactory
        super.init(router: router)
    }
    
    // MARK: Override functions
    
    override func start() {
        showItemAModule()
    }
}

// MARK: - Modules

private extension ItemACoordinator {
    
    func showItemAModule() {
        var module = modulesFactory.createItemAModule()
        
        module.output.didFinish = { [weak self] in
            
        }
        
        router.push(module)
    }
}

