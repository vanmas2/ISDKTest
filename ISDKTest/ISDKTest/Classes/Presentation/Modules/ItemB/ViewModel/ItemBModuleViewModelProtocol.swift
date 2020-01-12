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
    case setTitle(String)
    case setDesc(String)
    case setValue(Int)
    case setImageData(Data)
    case setLabels(String)
    case update
    case get
}

enum ItemBModuleViewModelMutation {
    case setTitle(String)
    case setDesc(String)
    case setValue(Int)
    case setImageData(Data)
    case setLabels(String)
    case update
    case set(ItemBModuleViewModelState)
}

struct ItemBModuleViewModelState {
    var title: String
    var desc: String
    var value: Int
    var imageData: Data
    var labels: String
}
