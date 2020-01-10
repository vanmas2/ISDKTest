//
//  ABListCoordinatorsFactoryProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import Foundation


// MARK: - ABListCoordinatorsFactoryProtocol

protocol ABListCoordinatorsFactoryProtocol: class {
    func createItemACoordinator(router: RouterProtocol) -> ItemACoordinatorProtocol
    func createItemBCoordinator(router: RouterProtocol) -> ItemBCoordinatorProtocol
    func createCreateItemACoordinator(router: RouterProtocol) -> CreateItemACoordinatorProtocol
    func createCreateItemBCoordinator(router: RouterProtocol) -> CreateItemBCoordinatorProtocol
}
