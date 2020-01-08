//
//  GetABListUseCaseAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import Swinject


// MARK: - GetABListUseCaseAssembly

final class GetABListUseCaseAssembly: Assembly {
    
    func assemble(container: Container) {
        registerUseCase(container)
    }
}

// MARK: - Helper functions

private extension GetABListUseCaseAssembly {
    
    func registerUseCase(_ container: Container) {
        container
            .register(GetABListUseCaseProtocol.self) { (resolver) in
                guard
                    let itemsARepository = resolver.resolve(ItemARepositoryProtocol.self),
                    let itemsBRepository = resolver.resolve(ItemBRepositoryProtocol.self)
                    else { fatalError() }
                return GetABListUseCase(itemsARepository: itemsARepository, itemsBRepository: itemsBRepository)
            }
            .inObjectScope(.transient)
    }
}

