//
//  GetItemBUseCaseAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import Swinject


// MARK: - GetItemBUseCaseAssembly

final class GetItemBUseCaseAssembly: Assembly {
    
    func assemble(container: Container) {
        registerUseCase(container)
    }
}

// MARK: - Helper functions

private extension GetItemBUseCaseAssembly {
    
    func registerUseCase(_ container: Container) {
        container
            .register(GetItemBUseCaseProtocol.self) { (resolver) in
                guard
                    let itemBRepository = resolver.resolve(ItemBRepositoryProtocol.self)
                    else { fatalError() }
                return GetItemBUseCase(itemBRepository: itemBRepository)
            }
            .inObjectScope(.transient)
    }
}
