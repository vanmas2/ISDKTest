//
//  ItemBModuleViewModelProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation
import RxSwift
import ReactorKit


protocol ItemBModuleViewModelProtocol {
    var vmState: Observable<ItemBModuleViewModelState> { get }
    var vmAction: ActionSubject<ItemBModuleViewModelAction> { get }
}

enum ItemBModuleViewModelAction {
 
}

enum ItemBModuleViewModelMutation {

}

struct ItemBModuleViewModelState {

}
