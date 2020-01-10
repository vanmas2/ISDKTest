//
//  ItemAModule.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import UIKit


// MARK: - ItemAModule

final class ItemAModule: Module, ItemAModuleProtocol {
    
    // MARK: Properties
    
    var input: ItemAModuleIntput
    
    var output: ItemAModuleOutput
    
    private var viewController: UIViewController?
    
    // MARK: Constructors
    
    init(input: ItemAModuleIntput, output: ItemAModuleOutput, viewController: UIViewController){
        self.viewController = viewController
        self.input = input
        self.output = output
    }
    
    // MARK: Functions
    
    func toPresent() -> UIViewController? {
        return viewController
    }
}
