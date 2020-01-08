//
//  ABListModule.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import UIKit


// MARK: - ABListModule

final class ABListModule: Module, ABListModuleProtocol {
    
    // MARK: Properties
    
    var input: ABListModuleIntput
    
    var output: ABListModuleOutput
    
    private var viewController: UIViewController?
    
    // MARK: Constructors
    
    init(input: ABListModuleIntput, output: ABListModuleOutput, viewController: UIViewController){
        self.viewController = viewController
        self.input = input
        self.output = output
    }
    
    // MARK: Functions
    
    func toPresent() -> UIViewController? {
        return viewController
    }
}
