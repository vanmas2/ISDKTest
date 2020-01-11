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
        registerLocalStorage(container)
    }
}

// MARK: - Helper functions

private extension ItemARepositoryAssembly {
    
    func registerRepository(_ container: Container) {
        container
            .register(ItemARepositoryProtocol.self) { (resolver) in
                guard
                    let localStorage = resolver.resolve(ItemALocalStorageProtocol.self)
                    else { fatalError() }
                return ItemARepository(localStorage: localStorage)
            }
            .inObjectScope(.container)
    }
    
    func registerLocalStorage(_ container: Container) {
        container
            .register(ItemALocalStorageProtocol.self) { (resolver) in
                guard
                    let provider = resolver.resolve(CoreDataProviderProtocol.self)
                    else { fatalError() }
                return ItemALocalStorage(provider: provider)
            }
            .inObjectScope(.container)
    }
}
