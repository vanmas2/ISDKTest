//
//  CoreDataProviderAssembly.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//


import Swinject


// MARK: - CoreDataProviderAssembly

class CoreDataProviderAssembly: Assembly {
    
    // MARK: - Functions
    
    func assemble(container: Container) {
        registerProvider(container)
    }
}

private extension CoreDataProviderAssembly {
    
    func registerProvider(_ container: Container) {
        container
            .register(CoreDataProviderProtocol.self) { (_) in
                return CoreDataProvider(withDataModelName: "ISDKTest", bundle: Bundle.main, persistentStoreName: "ISDKTest")
            }
            .inObjectScope(.container)
    }
}
