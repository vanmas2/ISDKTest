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
        
        module.output.showAddA = { [weak self] in
            // run A
        }
        
        module.output.showAddB = { [weak self] in
            // run B
        }
        
        router.setRootModule(module)
    }
}
