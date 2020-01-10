//
//  ABListCoordinatorsFactory.swift
//  ISDKTest
//
//  Created by Иван Масальских on 05/01/2020.
//

import Foundation


// MARK: - ABListCoordinatorsFactory

final class ABListCoordinatorsFactory {
    
    // MARK: - Properties
    
    private var itemACoordinator: (RouterProtocol) -> ItemACoordinatorProtocol
    
    private var itemBCoordinator: (RouterProtocol) -> ItemBCoordinatorProtocol
    
    private var createItemACoordinator: (RouterProtocol) -> CreateItemACoordinatorProtocol
    
    private var createItemBCoordinator: (RouterProtocol) -> CreateItemBCoordinatorProtocol
    
    // MARK: - Construction
    
    init(itemACoordinator: @escaping (RouterProtocol) -> ItemACoordinatorProtocol, itemBCoordinator: @escaping (RouterProtocol) -> ItemBCoordinatorProtocol, createItemACoordinator: @escaping (RouterProtocol) -> CreateItemACoordinatorProtocol, createItemBCoordinator: @escaping (RouterProtocol) -> CreateItemBCoordinatorProtocol) {
        self.itemACoordinator = itemACoordinator
        self.itemBCoordinator = itemBCoordinator
        self.createItemACoordinator = createItemACoordinator
        self.createItemBCoordinator = createItemBCoordinator
    }
}


// MARK: - ABListCoordinatorsFactoryProtocol

extension ABListCoordinatorsFactory: ABListCoordinatorsFactoryProtocol {
    
    func createItemACoordinator(router: RouterProtocol) -> ItemACoordinatorProtocol {
        return itemACoordinator(router)
    }
    
    func createItemBCoordinator(router: RouterProtocol) -> ItemBCoordinatorProtocol {
        return itemBCoordinator(router)
    }
    
    func createCreateItemACoordinator(router: RouterProtocol) -> CreateItemACoordinatorProtocol {
        return createItemACoordinator(router)
    }
    
    func createCreateItemBCoordinator(router: RouterProtocol) -> CreateItemBCoordinatorProtocol {
        return createItemBCoordinator(router)
    }
}
