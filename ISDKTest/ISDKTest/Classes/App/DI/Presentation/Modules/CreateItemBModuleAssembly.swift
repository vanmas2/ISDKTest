//
//  CreateItemBModuleAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Swinject


// MARK: - CreateItemBModuleAssembly

final class CreateItemBModuleAssembly: Assembly {
    
    func assemble(container: Container) {
        registerModule(container)
        registerViewModel(container)
    }
}

// MARK: - Helper functions

private extension CreateItemBModuleAssembly {
    
    func registerModule(_ container: Container) {
        container
            .register(CreateItemBModuleProtocol.self) { (resolver) in
                guard
                    let viewModel = resolver.resolve(CreateItemBModuleViewModelProtocol.self),
                    let input = viewModel as? CreateItemBModuleIntput,
                    let output = viewModel as? CreateItemBModuleOutput
                    else { fatalError() }
                let viewController = CreateItemBModuleViewController(viewModel: viewModel)
                return CreateItemBModule(input: input, output: output, viewController: viewController)
            }
            .inObjectScope(.transient)
    }
    
    func registerViewModel(_ container: Container) {
        container
            .register(CreateItemBModuleViewModelProtocol.self) { (resolver) in
                return CreateItemBModuleViewModel()
            }
            .inObjectScope(.transient)
    }
}
