//
//  ItemBModuleAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Swinject


// MARK: - ItemBModuleAssembly

final class ItemBModuleAssembly: Assembly {
    
    func assemble(container: Container) {
        registerModule(container)
        registerViewModel(container)
    }
}

// MARK: - Helper functions

private extension ItemBModuleAssembly {
    
    func registerModule(_ container: Container) {
        container
            .register(ItemBModuleProtocol.self) { (resolver, id: String?) in
                guard
                    let viewModel = resolver.resolve(ItemBModuleViewModelProtocol.self, argument: id),
                    let input = viewModel as? ItemBModuleIntput,
                    let output = viewModel as? ItemBModuleOutput
                    else { fatalError() }
                let viewController = ItemBModuleViewController(viewModel: viewModel)
                return ItemBModule(input: input, output: output, viewController: viewController)
            }
            .inObjectScope(.transient)
    }
    
    func registerViewModel(_ container: Container) {
        container
            .register(ItemBModuleViewModelProtocol.self) { (resolver, id: String?) in
                guard
                    let getItemBUseCase = resolver.resolve(GetItemBUseCaseProtocol.self),
                    let updateItemBUseCase = resolver.resolve(UpdateItemBUseCaseProtocol.self),
                    let createItemBUseCase = resolver.resolve(CreateItemBUseCaseProtocol.self)
                    else { fatalError() }
                return ItemBModuleViewModel(id: id, getItemBUseCase: getItemBUseCase, updateItemBUseCase: updateItemBUseCase, createItemBUseCase: createItemBUseCase)
            }
            .inObjectScope(.transient)
    }
}
