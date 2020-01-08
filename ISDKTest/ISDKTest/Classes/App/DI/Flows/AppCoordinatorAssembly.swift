//
//  AppCoordinatorAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import UIKit
import Swinject


// MARK: - AppCoordinatorAssembly

final class AppCoordinatorAssembly: Assembly {
    
    // MARK: Functions
    
    func assemble(container: Container) {
        registerCoordinator(container)
        registerCoordinatorsFactory(container)
        registerRouter(container)
    }
}


// MARK: - Helper functions

private extension AppCoordinatorAssembly {
    
    func registerCoordinator(_ container: Container) {
        container
            .register(AppCoordinatorProtocol.self) { (resolver, window: UIWindow) in
                let rootController = UINavigationController()
                guard
                    let coordinatorsFactory = resolver.resolve(AppCoordinatorsFactoryProtocol.self),
                    let router = resolver.resolve(RouterProtocol.self, argument: rootController)
                    else { fatalError() }
                return AppCoordinator(coordinatorsFactory: coordinatorsFactory, router: router, window: window)
            }
            .inObjectScope(.transient)
    }
    
    func registerCoordinatorsFactory(_ container: Container) {
        container
            .register(AppCoordinatorsFactoryProtocol.self) { (resolver) in
                let abListCoordinator: (RouterProtocol) -> ABListCoordinatorProtocol = { (router) in
                    guard
                        let coordinator = resolver.resolve(ABListCoordinatorProtocol.self, argument: router)
                        else { fatalError() }
                    return coordinator
                }
                return AppCoordinatorsFactory(abListCoordinator: abListCoordinator)
            }
            .inObjectScope(.container)
    }
    
    func registerRouter(_ container: Container) {
        container
            .register(RouterProtocol.self) { Router(rootController: $1) }
            .inObjectScope(.transient)
    }
}
