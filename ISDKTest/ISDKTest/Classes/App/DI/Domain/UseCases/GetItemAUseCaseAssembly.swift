//
//  GetItemAUseCaseAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Swinject


// MARK: - GetItemAUseCaseAssembly

final class GetItemAUseCaseAssembly: Assembly {
    
    func assemble(container: Container) {
        registerUseCase(container)
    }
}

// MARK: - Helper functions

private extension GetItemAUseCaseAssembly {
    
    func registerUseCase(_ container: Container) {
        container
            .register(GetItemAUseCaseProtocol.self) { (resolver) in
                guard
                    let itemsARepository = resolver.resolve(ItemARepositoryProtocol.self)
                    else { fatalError() }
                return GetItemAUseCase(itemsARepository: itemsARepository)
            }
            .inObjectScope(.transient)
    }
}
