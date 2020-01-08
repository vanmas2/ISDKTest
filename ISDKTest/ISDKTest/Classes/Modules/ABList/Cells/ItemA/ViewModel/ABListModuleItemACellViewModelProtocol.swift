//
//  ABListModuleItemACellViewModelProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 06/01/2020.
//

import Foundation
import RxRelay


protocol ABListModuleItemACellViewModelProtocol {
    var state: BehaviorRelay<ABListModuleItemACellViewModelState> { get set }
    var action: PublishRelay<ABListModuleItemACellViewModeAction> { get set }
}

struct ABListModuleItemACellViewModelState {
    var title: String
}

enum ABListModuleItemACellViewModeAction {
    case select
}
