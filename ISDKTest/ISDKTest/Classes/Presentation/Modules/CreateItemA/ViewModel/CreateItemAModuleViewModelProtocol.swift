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
    case setTitle(String)
    case setDesc(String)
    case setValue(Int)
    case setImageData(Data)
    case create
}

struct CreateItemAModuleViewModelState {
    var title: String
    var desc: String
    var value: Int
    var imageData: Data
}
