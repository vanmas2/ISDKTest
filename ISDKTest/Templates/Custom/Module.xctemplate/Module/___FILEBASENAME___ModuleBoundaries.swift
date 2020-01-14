//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation


protocol ___VARIABLE_sceneName___ModuleProtocol: Presentable {
    var input: ___VARIABLE_sceneName___ModuleIntput { get set }
    var output: ___VARIABLE_sceneName___ModuleOutput { get set }
}

protocol ___VARIABLE_sceneName___ModuleIntput {}

protocol ___VARIABLE_sceneName___ModuleOutput {
    var didFinish: (() -> Void)? { get set }
}
