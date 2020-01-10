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
            self?.runCreateItemACoordinator()
        }
        
        module.output.showAddItemB = { [weak self] in
            self?.runCreateItemBCoordinator()
        }
        
        module.output.showItemA = { [weak self] (id) in
            self?.runItemACoordinator(id: id)
        }
        
        module.output.showItemB = { [weak self] (id) in
            self?.runItemBCoordinator(id: id)
        }
        
        router.setRootModule(module)
    }
}

// MARK: - Coordinators

private extension ABListCoordinator {
    
    func runItemACoordinator(id: Int) {
        let coordinator = coordinatorsFactory.createItemACoordinator(router: router)
        
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
        }
        
        addDependency(coordinator)
        
        coordinator.start()
    }
    
    func runItemBCoordinator(id: Int) {
        let coordinator = coordinatorsFactory.createItemBCoordinator(router: router)
        
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
        }
        
        addDependency(coordinator)
        
        coordinator.start()
    }
    
    func runCreateItemACoordinator() {
        let coordinator = coordinatorsFactory.createCreateItemACoordinator(router: router)
        
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
        }
        
        addDependency(coordinator)
        
        coordinator.start()
    }
    
    func runCreateItemBCoordinator() {
        let coordinator = coordinatorsFactory.createCreateItemBCoordinator(router: router)
        
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
        }
        
        addDependency(coordinator)
        
        coordinator.start()
    }
}
