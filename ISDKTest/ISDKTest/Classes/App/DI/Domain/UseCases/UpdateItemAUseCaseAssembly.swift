//
//  UpdateItemAUseCaseAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Swinject


// MARK: - UpdateItemAUseCaseAssembly

final class UpdateItemAUseCaseAssembly: Assembly {
    
    func assemble(container: Container) {
        registerUseCase(container)
    }
}

// MARK: - Helper functions

private extension UpdateItemAUseCaseAssembly {
    
    func registerUseCase(_ container: Container) {
        container
            .register(UpdateItemAUseCaseProtocol.self) { (resolver) in
                guard
                    let itemsARepository = resolver.resolve(ItemARepositoryProtocol.self)
                    else { fatalError() }
                return UpdateItemAUseCase(itemsARepository: itemsARepository)
            }
            .inObjectScope(.transient)
    }
}
