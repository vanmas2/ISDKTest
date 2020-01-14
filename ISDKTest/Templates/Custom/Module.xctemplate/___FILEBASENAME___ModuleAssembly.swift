//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Swinject


// MARK: - ___VARIABLE_sceneName___ModuleAssembly

final class ___VARIABLE_sceneName___ModuleAssembly: Assembly {
    
    func assemble(container: Container) {
        registerModule(container)
        registerViewModel(container)
    }
}

// MARK: - Helper functions

private extension ___VARIABLE_sceneName___ModuleAssembly {
    
    func registerModule(_ container: Container) {
        container
            .register(___VARIABLE_sceneName___ModuleProtocol.self) { (resolver) in
                guard
                    let viewModel = resolver.resolve(___VARIABLE_sceneName___ModuleViewModelProtocol.self),
                    let input = viewModel as? ___VARIABLE_sceneName___ModuleIntput,
                    let output = viewModel as? ___VARIABLE_sceneName___ModuleOutput
                    else { fatalError() }
                let viewController = ___VARIABLE_sceneName___ModuleViewController(viewModel: viewModel)
                return ___VARIABLE_sceneName___Module(input: input, output: output, viewController: viewController)
            }
            .inObjectScope(.transient)
    }
    
    func registerViewModel(_ container: Container) {
        container
            .register(___VARIABLE_sceneName___ModuleViewModelProtocol.self) { (resolver) in
                return ___VARIABLE_sceneName___ModuleViewModel()
            }
            .inObjectScope(.transient)
    }
}
