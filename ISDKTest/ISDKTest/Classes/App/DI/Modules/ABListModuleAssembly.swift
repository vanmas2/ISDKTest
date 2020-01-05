//
//  ABListModuleAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import Swinject


// MARK: - ABListModuleAssembly

final class ABListModuleAssembly: Assembly {
    
    func assemble(container: Container) {
        registerModule(container)
    }
}


// MARK: - Helper functions

private extension ABListModuleAssembly {
    
    func registerModule(_ container: Container) {
        container
            .register(ABListModuleProtocol.self) { (resolver) in
                let viewController = ABListModuleViewController()
                return ABListModule(input: viewController, output: viewController, viewController: viewController)
            }
            .inObjectScope(.transient)
    }
}
