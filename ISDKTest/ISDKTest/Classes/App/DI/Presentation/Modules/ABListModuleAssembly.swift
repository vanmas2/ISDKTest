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
        registerViewModel(container)
    }
}


// MARK: - Helper functions

private extension ABListModuleAssembly {
    
    func registerModule(_ container: Container) {
        container
            .register(ABListModuleProtocol.self) { (resolver) in
                guard
                    let viewModel = resolver.resolve(ABListModuleViewModelProtocol.self),
                    let input = viewModel as? ABListModuleIntput,
                    let output = viewModel as? ABListModuleOutput
                    else { fatalError() }
                let viewController = ABListModuleViewController(viewModel: viewModel)
                return ABListModule(input: input, output: output, viewController: viewController)
            }
            .inObjectScope(.transient)
    }
    
    func registerViewModel(_ container: Container) {
        container
            .register(ABListModuleViewModelProtocol.self) { (resolver) in
                guard
                    let getABListUseCase = resolver.resolve(GetABListUseCaseProtocol.self)
                    else { fatalError() }
                return ABListModuleViewModel(getABListUseCase: getABListUseCase)
            }
            .inObjectScope(.transient)
    }
}
