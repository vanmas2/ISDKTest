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
    
    // MARK: Functions
    
    func start(id: String) {
        showItemBModule(id: id)
    }
}

// MARK: - Modules

private extension ItemBCoordinator {
    
    func showItemBModule(id: String) {
        var module = modulesFactory.createItemBModule(id: id)
        
        module.output.didFinish = { [weak self] in
            self?.router.popModule()
            self?.finishFlow?()
        }
        
        router.push(module, animated: true) { [weak self] in
            self?.finishFlow?()
        }
    }
}

