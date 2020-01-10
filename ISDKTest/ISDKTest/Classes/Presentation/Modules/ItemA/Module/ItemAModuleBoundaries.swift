//
//  ItemAModuleBoundaries.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation


protocol ItemAModuleProtocol: Presentable {
    var input: ItemAModuleIntput { get set }
    var output: ItemAModuleOutput { get set }
}

protocol ItemAModuleIntput {}

protocol ItemAModuleOutput {
    var didFinish: (() -> Void)? { get set }
}
