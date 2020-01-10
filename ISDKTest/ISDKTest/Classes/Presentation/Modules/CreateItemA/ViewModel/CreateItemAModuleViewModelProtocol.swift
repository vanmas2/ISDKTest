//
//  CreateItemAModuleViewModelProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation
import RxSwift
import ReactorKit


protocol CreateItemAModuleViewModelProtocol {
    var vmState: Observable<CreateItemAModuleViewModelState> { get }
    var vmAction: ActionSubject<CreateItemAModuleViewModelAction> { get }
}

enum CreateItemAModuleViewModelAction {
 
}

enum CreateItemAModuleViewModelMutation {

}

struct CreateItemAModuleViewModelState {

}
