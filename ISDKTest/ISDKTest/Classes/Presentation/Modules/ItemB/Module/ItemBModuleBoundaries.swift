//
//  ItemBModuleBoundaries.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation


protocol ItemBModuleProtocol: Presentable {
    var input: ItemBModuleIntput { get set }
    var output: ItemBModuleOutput { get set }
}

protocol ItemBModuleIntput {}

protocol ItemBModuleOutput {
    var didFinish: (() -> Void)? { get set }
}
