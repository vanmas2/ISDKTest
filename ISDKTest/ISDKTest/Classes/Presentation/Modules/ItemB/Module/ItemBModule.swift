//
//  ItemBModule.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import UIKit


// MARK: - ItemBModule

final class ItemBModule: Module, ItemBModuleProtocol {
    
    // MARK: Properties
    
    var input: ItemBModuleIntput
    
    var output: ItemBModuleOutput
    
    private var viewController: UIViewController?
    
    // MARK: Constructors
    
    init(input: ItemBModuleIntput, output: ItemBModuleOutput, viewController: UIViewController){
        self.viewController = viewController
        self.input = input
        self.output = output
    }
    
    // MARK: Functions
    
    func toPresent() -> UIViewController? {
        return viewController
    }
}
