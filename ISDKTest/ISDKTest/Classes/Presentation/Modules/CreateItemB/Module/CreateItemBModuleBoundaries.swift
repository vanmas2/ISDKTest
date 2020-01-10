//
//  CreateItemBModuleBoundaries.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation


protocol CreateItemBModuleProtocol: Presentable {
    var input: CreateItemBModuleIntput { get set }
    var output: CreateItemBModuleOutput { get set }
}

protocol CreateItemBModuleIntput {}

protocol CreateItemBModuleOutput {
    var didFinish: (() -> Void)? { get set }
}
