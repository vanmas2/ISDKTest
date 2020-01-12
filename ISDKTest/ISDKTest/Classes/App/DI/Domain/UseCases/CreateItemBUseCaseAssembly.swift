//
//  CreateItemBUseCaseAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import Swinject


// MARK: - CreateItemBUseCaseAssembly

final class CreateItemBUseCaseAssembly: Assembly {
    
    func assemble(container: Container) {
        registerUseCase(container)
    }
}

// MARK: - Helper functions

private extension CreateItemBUseCaseAssembly {
    
    func registerUseCase(_ container: Container) {
        container
            .register(CreateItemBUseCaseProtocol.self) { (resolver) in
                guard
                    let itemBRepository = resolver.resolve(ItemBRepositoryProtocol.self)
                    else { fatalError() }
                return CreateItemBUseCase(itemBRepository: itemBRepository)
            }
            .inObjectScope(.transient)
    }
}
