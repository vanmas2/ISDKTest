//
//  ItemBRepositoryAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import Swinject


// MARK: - ItemBRepositoryAssembly

final class ItemBRepositoryAssembly: Assembly {
    
    func assemble(container: Container) {
        registerRepository(container)
    }
}

// MARK: - Helper functions

private extension ItemBRepositoryAssembly {
    
    func registerRepository(_ container: Container) {
        container
            .register(ItemBRepositoryProtocol.self) { (resolver) in
                return ItemBRepository()
            }
            .inObjectScope(.transient)
    }
}
