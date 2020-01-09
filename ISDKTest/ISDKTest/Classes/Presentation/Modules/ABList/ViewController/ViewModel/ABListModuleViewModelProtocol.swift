//
//  ABListModuleViewModelProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 05/01/2020.
//

import Foundation
import RxSwift
import ReactorKit


protocol ABListModuleViewModelProtocol {
    var vmState: Observable<ABListModuleViewModelState> { get }
    var vmAction: ActionSubject<ABListModuleViewModelAction> { get }
}

enum ABListModuleViewModelAction {
    case createA
    case selectA
    case createB
    case selectB
    case refresh
}

enum ABListModuleViewModelMutation {
    case setItems([CellViewModelProtocol])
}

struct ABListModuleViewModelState {
    var cells: [CellViewModelProtocol]
}
