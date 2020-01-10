//
//  CreateItemBModule.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import UIKit


// MARK: - CreateItemBModule

final class CreateItemBModule: Module, CreateItemBModuleProtocol {
    
    // MARK: Properties
    
    var input: CreateItemBModuleIntput
    
    var output: CreateItemBModuleOutput
    
    private var viewController: UIViewController?
    
    // MARK: Constructors
    
    init(input: CreateItemBModuleIntput, output: CreateItemBModuleOutput, viewController: UIViewController){
        self.viewController = viewController
        self.input = input
        self.output = output
    }
    
    // MARK: Functions
    
    func toPresent() -> UIViewController? {
        return viewController
    }
}
