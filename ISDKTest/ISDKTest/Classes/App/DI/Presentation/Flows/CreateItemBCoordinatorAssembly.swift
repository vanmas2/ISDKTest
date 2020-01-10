//
//  CreateItemBCoordinatorAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Swinject


// MARK: - CreateItemBCoordinatorAssembly

final class CreateItemBCoordinatorAssembly: Assembly {
    
    // MARK: Functions
    
    func assemble(container: Container) {
        registerCoordinator(container)
        registerModulesFactory(container)
        registerCoordinatorsFactory(container)
    }
}


// MARK: - Helper functions

private extension CreateItemBCoordinatorAssembly {
    
    func registerCoordinator(_ container: Container) {
        container
            .register(CreateItemBCoordinatorProtocol.self) { (resolver, router: RouterProtocol) in
                guard
                    let modulesFactory = resolver.resolve(CreateItemBModulesFactoryProtocol.self),
                    let coordinatorsFactory = resolver.resolve(CreateItemBCoordinatorsFactoryProtocol.self)
                    else { fatalError() }
                return CreateItemBCoordinator(coordinatorsFactory: coordinatorsFactory, modulesFactory: modulesFactory, router: router)
            }
            .inObjectScope(.transient)
    }
    
    func registerModulesFactory(_ container: Container) {
        container
            .register(CreateItemBModulesFactoryProtocol.self) { (resolver) in
                let module: () -> CreateItemBModuleProtocol = { () -> CreateItemBModuleProtocol in
                    guard
                        let module = resolver.resolve(CreateItemBModuleProtocol.self)
                        else { fatalError() }
                    return module
                }
                return CreateItemBModulesFactory(module: module)
            }
            .inObjectScope(.container)
    }
    
    func registerCoordinatorsFactory(_ container: Container) {
        container
            .register(CreateItemBCoordinatorsFactoryProtocol.self) { (resolver) in
                return CreateItemBCoordinatorsFactory()
            }
            .inObjectScope(.container)
    }
}

