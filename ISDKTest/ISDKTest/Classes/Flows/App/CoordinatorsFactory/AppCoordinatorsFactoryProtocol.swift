//
//  AppCoordinatorsFactoryProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import Foundation


// MARK: - AppCoordinatorsFactoryProtocol

protocol AppCoordinatorsFactoryProtocol: class {
    func createABListCoordinator(router: RouterProtocol) -> ABListCoordinatorProtocol
}
