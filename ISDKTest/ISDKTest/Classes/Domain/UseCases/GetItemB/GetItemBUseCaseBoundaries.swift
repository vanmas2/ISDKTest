//
//  GetItemBUseCaseBoundaries.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import Foundation
import RxSwift


protocol GetItemBUseCaseProtocol {
    func execute(request: GetItemBUseCaseModels.Request) -> Observable<GetItemBUseCaseModels.Response>
}

enum GetItemBUseCaseModels {
    
    struct Request {
        let id: String
    }
    
    typealias Response = ItemBEntity?
}
