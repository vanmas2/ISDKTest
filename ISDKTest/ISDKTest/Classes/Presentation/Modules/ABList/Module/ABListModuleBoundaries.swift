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

protocol ABListModuleIntput {
    func refresh()
}

protocol ABListModuleOutput {
    var didFinish: (() -> Void)? { get set }
    var showAddItemA: (() -> Void)? { get set }
    var showAddItemB: (() -> Void)? { get set }
    var showItemA: ((String) -> Void)? { get set }
    var showItemB: ((String) -> Void)? { get set }
}
