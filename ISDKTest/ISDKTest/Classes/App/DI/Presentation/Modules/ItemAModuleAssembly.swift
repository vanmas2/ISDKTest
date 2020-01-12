//
//  ItemAModuleAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Swinject


// MARK: - ItemAModuleAssembly

final class ItemAModuleAssembly: Assembly {
    
    func assemble(container: Container) {
        registerModule(container)
        registerViewModel(container)
    }
}

// MARK: - Helper functions

private extension ItemAModuleAssembly {
    
    func registerModule(_ container: Container) {
        container
            .register(ItemAModuleProtocol.self) { (resolver, id: String?) in
                guard
                    let viewModel = resolver.resolve(ItemAModuleViewModelProtocol.self, argument: id),
                    let input = viewModel as? ItemAModuleIntput,
                    let output = viewModel as? ItemAModuleOutput
                    else { fatalError() }
                let viewController = ItemAModuleViewController(viewModel: viewModel)
                return ItemAModule(input: input, output: output, viewController: viewController)
            }
            .inObjectScope(.transient)
    }
    
    func registerViewModel(_ container: Container) {
        container
            .register(ItemAModuleViewModelProtocol.self) { (resolver, id: String?) in
                guard
                    let updateItemAUseCase = resolver.resolve(UpdateItemAUseCaseProtocol.self),
                    let getItemAUseCase = resolver.resolve(GetItemAUseCaseProtocol.self),
                    let createItemAUseCase = resolver.resolve(CreateItemAUseCaseProtocol.self)
                    else { fatalError() }
                return ItemAModuleViewModel(id: id, getItemAUseCase: getItemAUseCase, updateItemAUseCase: updateItemAUseCase, createItemAUseCase: createItemAUseCase)
            }
            .inObjectScope(.transient)
    }
}
