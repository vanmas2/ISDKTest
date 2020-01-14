//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Swinject


// MARK: - ___VARIABLE_sceneName___CoordinatorAssembly

final class ___VARIABLE_sceneName___CoordinatorAssembly: Assembly {
    
    // MARK: Functions
    
    func assemble(container: Container) {
        registerCoordinator(container)
        registerModulesFactory(container)
        registerCoordinatorsFactory(container)
    }
}


// MARK: - Helper functions

private extension ___VARIABLE_sceneName___CoordinatorAssembly {
    
    func registerCoordinator(_ container: Container) {
        container
            .register(___VARIABLE_sceneName___CoordinatorProtocol.self) { (resolver, router: RouterProtocol) in
                guard
                    let modulesFactory = resolver.resolve(___VARIABLE_sceneName___ModulesFactoryProtocol.self),
                    let coordinatorsFactory = resolver.resolve(___VARIABLE_sceneName___CoordinatorsFactoryProtocol.self)
                    else { fatalError() }
                return ___VARIABLE_sceneName___Coordinator(coordinatorsFactory: coordinatorsFactory, modulesFactory: modulesFactory, router: router)
            }
            .inObjectScope(.transient)
    }
    
    func registerModulesFactory(_ container: Container) {
        container
            .register(___VARIABLE_sceneName___ModulesFactoryProtocol.self) { (resolver) in
                let module: () -> ___VARIABLE_sceneName___ModuleProtocol = { () -> ___VARIABLE_sceneName___ModuleProtocol in
                    guard
                        let module = resolver.resolve(___VARIABLE_sceneName___ModuleProtocol.self)
                        else { fatalError() }
                    return module
                }
                return ___VARIABLE_sceneName___ModulesFactory(module: module)
            }
            .inObjectScope(.container)
    }
    
    func registerCoordinatorsFactory(_ container: Container) {
        container
            .register(___VARIABLE_sceneName___CoordinatorsFactoryProtocol.self) { (resolver) in
                return ___VARIABLE_sceneName___CoordinatorsFactory()
            }
            .inObjectScope(.container)
    }
}

