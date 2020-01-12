//
//  ItemACoordinatorAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Swinject


// MARK: - ItemACoordinatorAssembly

final class ItemACoordinatorAssembly: Assembly {
    
    // MARK: Functions
    
    func assemble(container: Container) {
        registerCoordinator(container)
        registerModulesFactory(container)
        registerCoordinatorsFactory(container)
    }
}


// MARK: - Helper functions

private extension ItemACoordinatorAssembly {
    
    func registerCoordinator(_ container: Container) {
        container
            .register(ItemACoordinatorProtocol.self) { (resolver, router: RouterProtocol) in
                guard
                    let modulesFactory = resolver.resolve(ItemAModulesFactoryProtocol.self),
                    let coordinatorsFactory = resolver.resolve(ItemACoordinatorsFactoryProtocol.self)
                    else { fatalError() }
                return ItemACoordinator(coordinatorsFactory: coordinatorsFactory, modulesFactory: modulesFactory, router: router)
            }
            .inObjectScope(.transient)
    }
    
    func registerModulesFactory(_ container: Container) {
        container
            .register(ItemAModulesFactoryProtocol.self) { (resolver) in
                let module: (String?) -> ItemAModuleProtocol = { (id) -> ItemAModuleProtocol in
                    guard
                        let module = resolver.resolve(ItemAModuleProtocol.self, argument: id)
                        else { fatalError() }
                    return module
                }
                return ItemAModulesFactory(module: module)
            }
            .inObjectScope(.container)
    }
    
    func registerCoordinatorsFactory(_ container: Container) {
        container
            .register(ItemACoordinatorsFactoryProtocol.self) { (resolver) in
                return ItemACoordinatorsFactory()
            }
            .inObjectScope(.container)
    }
}

