//
//  CreateItemABoundaries.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation
import RxSwift


protocol CreateItemAUseCaseProtocol {
    func execute(request: CreateItemAUseCaseModels.Request) -> Observable<CreateItemAUseCaseModels.Response>
}

enum CreateItemAUseCaseModels {
    
    struct Request {
        let title: String
        let desc: String
        let value: Int
        let image: Data
    }
    
    struct Response {}
}
