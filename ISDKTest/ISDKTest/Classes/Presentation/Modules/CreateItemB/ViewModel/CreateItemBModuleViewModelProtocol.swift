//
//  CreateItemBModuleViewModelProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation
import RxSwift
import ReactorKit


protocol CreateItemBModuleViewModelProtocol {
    var vmState: Observable<CreateItemBModuleViewModelState> { get }
    var vmAction: ActionSubject<CreateItemBModuleViewModelAction> { get }
}

enum CreateItemBModuleViewModelAction {
 
}

enum CreateItemBModuleViewModelMutation {

}

struct CreateItemBModuleViewModelState {

}
