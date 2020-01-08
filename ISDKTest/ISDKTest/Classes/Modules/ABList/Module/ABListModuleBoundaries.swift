//
//  ABListModuleBoundaries.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import Foundation


protocol ABListModuleProtocol: Presentable {
    var input: ABListModuleIntput { get set }
    var output: ABListModuleOutput { get set }
}

protocol ABListModuleIntput {}

protocol ABListModuleOutput {
    var didFinish: (() -> Void)? { get set }
    var showAddA: (() -> Void)? { get set }
    var showAddB: (() -> Void)? { get set }
}
