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
    case setTitle(String)
    case setDesc(String)
    case setValue(Int)
    case setImageData(Data)
    case update
    case get
}

enum ItemAModuleViewModelMutation {
    case setTitle(String)
    case setDesc(String)
    case setValue(Int)
    case setImageData(Data)
    case update
    case set(ItemAModuleViewModelState)
}

struct ItemAModuleViewModelState {
    var title: String
    var desc: String
    var value: Int
    var imageData: Data
}
