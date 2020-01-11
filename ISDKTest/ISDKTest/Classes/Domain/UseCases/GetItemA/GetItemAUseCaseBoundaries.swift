//
//  GetItemAUseCaseBoundaries.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation
import RxSwift


protocol GetItemAUseCaseProtocol {
    func execute(request: GetItemAUseCaseModels.Request) -> Observable<GetItemAUseCaseModels.Response>
}

enum GetItemAUseCaseModels {
    
    struct Request {
        let id: String
    }
    
    typealias Response = ItemAEntity?
}
