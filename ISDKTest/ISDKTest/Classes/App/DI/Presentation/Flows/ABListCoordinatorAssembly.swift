//
//  ABListCoordinatorAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 05/01/2020.
//

import Swinject


// MARK: - ABListCoordinatorAssembly

final class ABListCoordinatorAssembly: Assembly {
    
    // MARK: Functions
    
    func assemble(container: Container) {
        registerCoordinator(container)
        registerModulesFactory(container)
        registerCoordinatorsFactory(container)
    }
}


// MARK: - Helper functions

private extension ABListCoordinatorAssembly {
    
    func registerCoordinator(_ container: Container) {
        container
            .register(ABListCoordinatorProtocol.self) { (resolver, router: RouterProtocol) in
                guard
                    let modulesFactory = resolver.resolve(ABListModulesFactoryProtocol.self),
                    let coordinatorsFactory = resolver.resolve(ABListCoordinatorsFactoryProtocol.self)
                    else { fatalError() }
                return ABListCoordinator(coordinatorsFactory: coordinatorsFactory, modulesFactory: modulesFactory, router: router)
            }
            .inObjectScope(.transient)
    }
    
    func registerModulesFactory(_ container: Container) {
        container
            .register(ABListModulesFactoryProtocol.self) { (resolver) in
                let abListModule: () -> ABListModuleProtocol = { () -> ABListModuleProtocol in
                    guard
                        let module = resolver.resolve(ABListModuleProtocol.self)
                        else { fatalError() }
                    return module
                }
                return ABListModulesFactory(abListModule: abListModule)
            }
            .inObjectScope(.container)
    }
    
    func registerCoordinatorsFactory(_ container: Container) {
        container
            .register(ABListCoordinatorsFactoryProtocol.self) { (resolver) in
                return ABListCoordinatorsFactory()
            }
            .inObjectScope(.container)
    }
}

