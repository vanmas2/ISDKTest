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
    case setTitle(String)
    case setDesc(String)
    case setValue(Int)
    case setImageData(Data)
    case setLabels(String)
    case create
}

struct CreateItemBModuleViewModelState {
    var title: String
    var desc: String
    var value: Int
    var imageData: Data
    var labels: String
}
