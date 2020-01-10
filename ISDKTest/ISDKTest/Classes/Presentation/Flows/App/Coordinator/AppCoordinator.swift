//
//  AppCoordinator.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import UIKit


// MARK: - AppCoordinator

final class AppCoordinator: Coordinator, AppCoordinatorProtocol {
    
    // MARK: Properties
    
    private let coordinatorsFactory: AppCoordinatorsFactoryProtocol
    
    private var window: UIWindow
    
    // MARK: Constructors
    
    init(coordinatorsFactory: AppCoordinatorsFactoryProtocol, router: RouterProtocol, window: UIWindow) {
        self.coordinatorsFactory = coordinatorsFactory
        self.window = window
        self.window.rootViewController = router.toPresent()
        super.init(router: router)
    }
    
    // MARK: Override functions
    
    override func start() {
        window.makeKeyAndVisible()
        runABCoordinator()
    }
}

// MARK: - Coordinators

private extension AppCoordinator {
    
    func runABCoordinator() {
        let coordinator = coordinatorsFactory.createABListCoordinator(router: router)
        addDependency(coordinator)
        coordinator.start()
    }
}
