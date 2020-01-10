//
//  CreateItemAModuleBoundaries.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation


protocol CreateItemAModuleProtocol: Presentable {
    var input: CreateItemAModuleIntput { get set }
    var output: CreateItemAModuleOutput { get set }
}

protocol CreateItemAModuleIntput {}

protocol CreateItemAModuleOutput {
    var didFinish: (() -> Void)? { get set }
}
