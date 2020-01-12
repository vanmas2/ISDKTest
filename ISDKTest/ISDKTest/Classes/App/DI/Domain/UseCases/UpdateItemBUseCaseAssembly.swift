//
//  UpdateItemBUseCaseAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import Swinject


// MARK: - UpdateItemBUseCaseAssembly

final class UpdateItemBUseCaseAssembly: Assembly {
    
    func assemble(container: Container) {
        registerUseCase(container)
    }
}

// MARK: - Helper functions

private extension UpdateItemBUseCaseAssembly {
    
    func registerUseCase(_ container: Container) {
        container
            .register(UpdateItemBUseCaseProtocol.self) { (resolver) in
                guard
                    let itemBRepository = resolver.resolve(ItemBRepositoryProtocol.self)
                    else { fatalError() }
                return UpdateItemBUseCase(itemBRepository: itemBRepository)
            }
            .inObjectScope(.transient)
    }
}
