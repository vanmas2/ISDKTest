//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation


// MARK: - ___VARIABLE_sceneName___Coordinator

final class ___VARIABLE_sceneName___Coordinator: Coordinator, ___VARIABLE_sceneName___CoordinatorProtocol {
    
    // MARK: Properties
    
    private let coordinatorsFactory: ___VARIABLE_sceneName___CoordinatorsFactoryProtocol
    
    private let modulesFactory: ___VARIABLE_sceneName___ModulesFactoryProtocol
    
    // MARK: Constructors
    
    init(coordinatorsFactory: ___VARIABLE_sceneName___CoordinatorsFactoryProtocol, modulesFactory: ___VARIABLE_sceneName___ModulesFactoryProtocol, router: RouterProtocol) {
        self.coordinatorsFactory = coordinatorsFactory
        self.modulesFactory = modulesFactory
        super.init(router: router)
    }
    
    // MARK: Override functions
    
    override func start() {
        show___VARIABLE_sceneName___Module()
    }
}

// MARK: - Modules

private extension ___VARIABLE_sceneName___Coordinator {
    
    func show___VARIABLE_sceneName___Module() {
        var module = modulesFactory.create___VARIABLE_sceneName___Module()
        
        module.output.didFinish = { [weak self] in
            
        }
        
        router.push(module)
    }
}

