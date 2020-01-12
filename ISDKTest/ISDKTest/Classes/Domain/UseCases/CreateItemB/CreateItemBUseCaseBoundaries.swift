//
//  CreateItemBUseCaseBoundaries.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import Foundation
import RxSwift


protocol CreateItemBUseCaseProtocol {
    func execute(request: CreateItemBUseCaseModels.Request) -> Observable<CreateItemBUseCaseModels.Response>
}

enum CreateItemBUseCaseModels {
    
    struct Request {
        let title: String
        let desc: String
        let value: Int
        let image: Data
        let labels: [String]
    }
    
    struct Response {}
}
