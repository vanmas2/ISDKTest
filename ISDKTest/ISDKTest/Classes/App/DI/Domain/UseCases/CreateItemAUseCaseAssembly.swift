//
//  CreateItemAUseCaseAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Swinject


// MARK: - CreateItemAUseCaseAssembly

final class CreateItemAUseCaseAssembly: Assembly {
    
    func assemble(container: Container) {
        registerUseCase(container)
    }
}

// MARK: - Helper functions

private extension CreateItemAUseCaseAssembly {
    
    func registerUseCase(_ container: Container) {
        container
            .register(CreateItemAUseCaseProtocol.self) { (resolver) in
                guard
                    let itemsARepository = resolver.resolve(ItemARepositoryProtocol.self)
                    else { fatalError() }
                return CreateItemAUseCase(itemsARepository: itemsARepository)
            }
            .inObjectScope(.transient)
    }
}
