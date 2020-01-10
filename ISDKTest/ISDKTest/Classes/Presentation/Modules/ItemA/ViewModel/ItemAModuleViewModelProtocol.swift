//
//  ItemAModuleViewModelProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation
import RxSwift
import ReactorKit


protocol ItemAModuleViewModelProtocol {
    var vmState: Observable<ItemAModuleViewModelState> { get }
    var vmAction: ActionSubject<ItemAModuleViewModelAction> { get }
}

enum ItemAModuleViewModelAction {
 
}

enum ItemAModuleViewModelMutation {

}

struct ItemAModuleViewModelState {

}
