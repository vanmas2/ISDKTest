//
//  ABListCoordinator.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import Foundation


// MARK: - ABListCoordinator

final class ABListCoordinator: Coordinator, ABListCoordinatorProtocol {
    
    // MARK: Properties
    
    private let coordinatorsFactory: ABListCoordinatorsFactoryProtocol
    
    private let modulesFactory: ABListModulesFactoryProtocol
    
    // MARK: Constructors
    
    init(coordinatorsFactory: ABListCoordinatorsFactoryProtocol, modulesFactory: ABListModulesFactoryProtocol, router: RouterProtocol) {
        self.coordinatorsFactory = coordinatorsFactory
        self.modulesFactory = modulesFactory
        super.init(router: router)
    }
    
    // MARK: Override functions
    
    override func start() {
        showABModule()
    }
}


// MARK: - Coordinators

private extension ABListCoordinator {
    
    func showABModule() {
        var module = modulesFactory.createABListModule()
        
        module.output.showAddItemA = { [weak self] in
            
        }
        
        module.output.showAddItemB = { [weak self] in
            
        }
        
        module.output.showItemA = { [weak self] (id) in
            
        }
        
        module.output.showItemB = { [weak self] (id) in
            
        }
        
        router.setRootModule(module)
    }
}
