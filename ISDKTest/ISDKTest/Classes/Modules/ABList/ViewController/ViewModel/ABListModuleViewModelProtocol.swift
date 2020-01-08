//
//  ABListModuleViewModelProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 05/01/2020.
//

import Foundation
import RxRelay


protocol ABListModuleViewModelProtocol {
    var state: BehaviorRelay<ABListModuleViewModelState> { get set }
    var action: PublishRelay<ABListModuleViewModelAction> { get set }
}

enum ABListModuleViewModelAction {
    case createA
    case selectA
    case createB
    case selectB
    case refresh
}

struct ABListModuleViewModelState {
    var cells: [CellViewModelProtocol]
}
