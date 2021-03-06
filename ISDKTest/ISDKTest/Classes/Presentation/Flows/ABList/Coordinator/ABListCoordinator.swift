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
    
    private var rootModule: ABListModuleProtocol?
    
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
        self.rootModule = module
        
        module.output.showAddItemA = { [weak self] in
            self?.runItemACoordinator(id: nil)
        }
        
        module.output.showAddItemB = { [weak self] in
            self?.runItemBCoordinator(id: nil)
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
    
    func runItemACoordinator(id: String?) {
        let coordinator = coordinatorsFactory.createItemACoordinator(router: router)
        
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
            self?.rootModule?.input.refresh()
        }
        
        addDependency(coordinator)
        
        coordinator.start(id: id)
    }
    
    func runItemBCoordinator(id: String?) {
        let coordinator = coordinatorsFactory.createItemBCoordinator(router: router)
        
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
            self?.rootModule?.input.refresh()
        }
        
        addDependency(coordinator)
        
        coordinator.start(id: id)
    }
}
