//
//  ItemBCoordinatorAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Swinject


// MARK: - ItemBCoordinatorAssembly

final class ItemBCoordinatorAssembly: Assembly {
    
    // MARK: Functions
    
    func assemble(container: Container) {
        registerCoordinator(container)
        registerModulesFactory(container)
        registerCoordinatorsFactory(container)
    }
}


// MARK: - Helper functions

private extension ItemBCoordinatorAssembly {
    
    func registerCoordinator(_ container: Container) {
        container
            .register(ItemBCoordinatorProtocol.self) { (resolver, router: RouterProtocol) in
                guard
                    let modulesFactory = resolver.resolve(ItemBModulesFactoryProtocol.self),
                    let coordinatorsFactory = resolver.resolve(ItemBCoordinatorsFactoryProtocol.self)
                    else { fatalError() }
                return ItemBCoordinator(coordinatorsFactory: coordinatorsFactory, modulesFactory: modulesFactory, router: router)
            }
            .inObjectScope(.transient)
    }
    
    func registerModulesFactory(_ container: Container) {
        container
            .register(ItemBModulesFactoryProtocol.self) { (resolver) in
                let module: () -> ItemBModuleProtocol = { () -> ItemBModuleProtocol in
                    guard
                        let module = resolver.resolve(ItemBModuleProtocol.self)
                        else { fatalError() }
                    return module
                }
                return ItemBModulesFactory(module: module)
            }
            .inObjectScope(.container)
    }
    
    func registerCoordinatorsFactory(_ container: Container) {
        container
            .register(ItemBCoordinatorsFactoryProtocol.self) { (resolver) in
                return ItemBCoordinatorsFactory()
            }
            .inObjectScope(.container)
    }
}

