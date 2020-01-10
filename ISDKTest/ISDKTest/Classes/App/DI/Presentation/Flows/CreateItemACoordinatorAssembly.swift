//
//  CreateItemACoordinatorAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Swinject


// MARK: - CreateItemACoordinatorAssembly

final class CreateItemACoordinatorAssembly: Assembly {
    
    // MARK: Functions
    
    func assemble(container: Container) {
        registerCoordinator(container)
        registerModulesFactory(container)
        registerCoordinatorsFactory(container)
    }
}


// MARK: - Helper functions

private extension CreateItemACoordinatorAssembly {
    
    func registerCoordinator(_ container: Container) {
        container
            .register(CreateItemACoordinatorProtocol.self) { (resolver, router: RouterProtocol) in
                guard
                    let modulesFactory = resolver.resolve(CreateItemAModulesFactoryProtocol.self),
                    let coordinatorsFactory = resolver.resolve(CreateItemACoordinatorsFactoryProtocol.self)
                    else { fatalError() }
                return CreateItemACoordinator(coordinatorsFactory: coordinatorsFactory, modulesFactory: modulesFactory, router: router)
            }
            .inObjectScope(.transient)
    }
    
    func registerModulesFactory(_ container: Container) {
        container
            .register(CreateItemAModulesFactoryProtocol.self) { (resolver) in
                let module: () -> CreateItemAModuleProtocol = { () -> CreateItemAModuleProtocol in
                    guard
                        let module = resolver.resolve(CreateItemAModuleProtocol.self)
                        else { fatalError() }
                    return module
                }
                return CreateItemAModulesFactory(module: module)
            }
            .inObjectScope(.container)
    }
    
    func registerCoordinatorsFactory(_ container: Container) {
        container
            .register(CreateItemACoordinatorsFactoryProtocol.self) { (resolver) in
                return CreateItemACoordinatorsFactory()
            }
            .inObjectScope(.container)
    }
}

