//
//  ItemARepositoryAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import Swinject


// MARK: - ItemARepositoryAssembly

final class ItemARepositoryAssembly: Assembly {
    
    func assemble(container: Container) {
        registerRepository(container)
    }
}

// MARK: - Helper functions

private extension ItemARepositoryAssembly {
    
    func registerRepository(_ container: Container) {
        container
            .register(ItemARepositoryProtocol.self) { (resolver) in
                return ItemARepository()
            }
            .inObjectScope(.transient)
    }
}
