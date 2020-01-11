//
//  CreateItemAModuleAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Swinject


// MARK: - CreateItemAModuleAssembly

final class CreateItemAModuleAssembly: Assembly {
    
    func assemble(container: Container) {
        registerModule(container)
        registerViewModel(container)
    }
}

// MARK: - Helper functions

private extension CreateItemAModuleAssembly {
    
    func registerModule(_ container: Container) {
        container
            .register(CreateItemAModuleProtocol.self) { (resolver) in
                guard
                    let viewModel = resolver.resolve(CreateItemAModuleViewModelProtocol.self),
                    let input = viewModel as? CreateItemAModuleIntput,
                    let output = viewModel as? CreateItemAModuleOutput
                    else { fatalError() }
                let viewController = CreateItemAModuleViewController(viewModel: viewModel)
                return CreateItemAModule(input: input, output: output, viewController: viewController)
            }
            .inObjectScope(.transient)
    }
    
    func registerViewModel(_ container: Container) {
        container
            .register(CreateItemAModuleViewModelProtocol.self) { (resolver) in
                guard
                    let createItemAUseCase = resolver.resolve(CreateItemAUseCaseProtocol.self)
                    else { fatalError() }
                return CreateItemAModuleViewModel(createItemAUseCase: createItemAUseCase)
            }
            .inObjectScope(.transient)
    }
}
