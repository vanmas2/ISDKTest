//
//  ABListModuleItemBCellViewModelProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import Foundation
import RxRelay


protocol ABListModuleItemBCellViewModelProtocol {
    var state: BehaviorRelay<ABListModuleItemBCellViewModelState> { get set }
    var action: PublishRelay<ABListModuleItemBCellViewModeAction> { get set }
}

struct ABListModuleItemBCellViewModelState {
    var title: String
    var desc: String
    var value: String
    var image: Data
    var labels: String
}

enum ABListModuleItemBCellViewModeAction {
    case select
}
