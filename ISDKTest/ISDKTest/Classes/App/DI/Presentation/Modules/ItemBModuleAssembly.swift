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
            .register(ItemBModuleProtocol.self) { (resolver) in
                guard
                    let viewModel = resolver.resolve(ItemBModuleViewModelProtocol.self),
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
            .register(ItemBModuleViewModelProtocol.self) { (resolver) in
                return ItemBModuleViewModel()
            }
            .inObjectScope(.transient)
    }
}
