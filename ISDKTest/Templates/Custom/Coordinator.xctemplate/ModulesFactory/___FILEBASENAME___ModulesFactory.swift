//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation


// MARK: - ___VARIABLE_sceneName___ModulesFactory

class ___VARIABLE_sceneName___ModulesFactory {
    
    // MARK: - Properties
    
    private var module: () -> ___VARIABLE_sceneName___ModuleProtocol
    
    // MARK: - Construction
    
    init(module: @escaping () -> ___VARIABLE_sceneName___ModuleProtocol) {
        self.module = module
    }
}


// MARK: - ___VARIABLE_sceneName___ModulesFactoryProtocol

extension ___VARIABLE_sceneName___ModulesFactory: ___VARIABLE_sceneName___ModulesFactoryProtocol {
    
    func create___VARIABLE_sceneName___Module() -> ___VARIABLE_sceneName___ModuleProtocol {
        return module()
    }
}
