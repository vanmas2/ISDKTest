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
    case selectSort(Int)
}

enum ABListModuleViewModelMutation {
    case setItems([CellViewModelProtocol])
    case setSortType(SortTypeItem)
}

struct ABListModuleViewModelState {
    var cells: [CellViewModelProtocol]
    var sortTypeItems: [SortTypeItem]
    var sortTypeItemSelected: SortTypeItem
}

enum SortTypeItem: Int, CaseIterable {
    case title
    case value
    case aItems
    case bItems
    
    var title: String {
        switch self {
        case .title:
            return "Title"
        case .value:
            return "Value"
        case .aItems:
            return "A"
        case .bItems:
            return "B"
        }
    }
}
