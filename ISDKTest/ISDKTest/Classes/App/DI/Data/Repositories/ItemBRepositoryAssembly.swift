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
        registerLocalStorage(container)
    }
}

// MARK: - Helper functions

private extension ItemBRepositoryAssembly {
    
    func registerRepository(_ container: Container) {
        container
            .register(ItemBRepositoryProtocol.self) { (resolver) in
                guard
                    let localStorage = resolver.resolve(ItemBLocalStorageProtocol.self)
                    else { fatalError() }
                return ItemBRepository(localStorage: localStorage)
            }
            .inObjectScope(.transient)
    }
    
    func registerLocalStorage(_ container: Container) {
        container
            .register(ItemBLocalStorageProtocol.self) { (resolver) in
                guard
                    let provider = resolver.resolve(CoreDataProviderProtocol.self)
                    else { fatalError() }
                return ItemBLocalStorage(provider: provider)
            }
            .inObjectScope(.container)
    }
}
