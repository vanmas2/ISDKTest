//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit


// MARK: - ___VARIABLE_sceneName___Module

final class ___VARIABLE_sceneName___Module: Module, ___VARIABLE_sceneName___ModuleProtocol {
    
    // MARK: Properties
    
    var input: ___VARIABLE_sceneName___ModuleIntput
    
    var output: ___VARIABLE_sceneName___ModuleOutput
    
    private var viewController: UIViewController?
    
    // MARK: Constructors
    
    init(input: ___VARIABLE_sceneName___ModuleIntput, output: ___VARIABLE_sceneName___ModuleOutput, viewController: UIViewController){
        self.viewController = viewController
        self.input = input
        self.output = output
    }
    
    // MARK: Functions
    
    func toPresent() -> UIViewController? {
        return viewController
    }
}
