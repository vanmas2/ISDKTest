//
//  ItemBCoordinator.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation


// MARK: - ItemBCoordinator

final class ItemBCoordinator: Coordinator, ItemBCoordinatorProtocol {
    
    // MARK: Properties
    
    private let coordinatorsFactory: ItemBCoordinatorsFactoryProtocol
    
    private let modulesFactory: ItemBModulesFactoryProtocol
    
    // MARK: Constructors
    
    init(coordinatorsFactory: ItemBCoordinatorsFactoryProtocol, modulesFactory: ItemBModulesFactoryProtocol, router: RouterProtocol) {
        self.coordinatorsFactory = coordinatorsFactory
        self.modulesFactory = modulesFactory
        super.init(router: router)
    }
    
    // MARK: Override functions
    
    override func start() {
        showItemBModule()
    }
}

// MARK: - Modules

private extension ItemBCoordinator {
    
    func showItemBModule() {
        var module = modulesFactory.createItemBModule()
        
        module.output.didFinish = { [weak self] in
            
        }
        
        router.push(module)
    }
}

