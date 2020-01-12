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
        
    // MARK: - Construction
    
    init(itemACoordinator: @escaping (RouterProtocol) -> ItemACoordinatorProtocol, itemBCoordinator: @escaping (RouterProtocol) -> ItemBCoordinatorProtocol) {
        self.itemACoordinator = itemACoordinator
        self.itemBCoordinator = itemBCoordinator
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
}
