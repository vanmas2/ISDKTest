//
//  AppCoordinatorsFactory.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import Foundation


// MARK: - AppCoordinatorsFactory

final class AppCoordinatorsFactory {
    
    // MARK: - Properties
    
    private var abListCoordinator: (RouterProtocol) -> ABListCoordinatorProtocol
    
    // MARK: - Construction
    
    init(abListCoordinator: @escaping (RouterProtocol) -> ABListCoordinatorProtocol) {
        self.abListCoordinator = abListCoordinator
    }
}


// MARK: - AppCoordinatorsFactoryProtocol

extension AppCoordinatorsFactory: AppCoordinatorsFactoryProtocol {
    
    func createABListCoordinator(router: RouterProtocol) -> ABListCoordinatorProtocol {
        return abListCoordinator(router)
    }
}
