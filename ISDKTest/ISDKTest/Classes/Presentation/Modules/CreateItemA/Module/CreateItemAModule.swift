//
//  CreateItemAModule.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import UIKit


// MARK: - CreateItemAModule

final class CreateItemAModule: Module, CreateItemAModuleProtocol {
    
    // MARK: Properties
    
    var input: CreateItemAModuleIntput
    
    var output: CreateItemAModuleOutput
    
    private var viewController: UIViewController?
    
    // MARK: Constructors
    
    init(input: CreateItemAModuleIntput, output: CreateItemAModuleOutput, viewController: UIViewController){
        self.viewController = viewController
        self.input = input
        self.output = output
    }
    
    // MARK: Functions
    
    func toPresent() -> UIViewController? {
        return viewController
    }
}
