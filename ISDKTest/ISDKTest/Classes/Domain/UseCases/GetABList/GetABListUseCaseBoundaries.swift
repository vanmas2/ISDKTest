//
//  GetABListUseCaseBoundaries.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import Foundation
import RxSwift


protocol GetABListUseCaseProtocol {
    func execute(request: GetABListUseCaseModels.Request) -> Observable<GetABListUseCaseModels.Response>
}

enum GetABListUseCaseModels {
    
    struct Request {
        let sort: Sort
        
        enum Sort {
            case title
            case value
            case aType
            case bType
        }
    }
    
    struct Response {
        let items: [Item]
        
        enum Item {
            case itemA(ItemA)
            case itemB(ItemB)
        }
        
        typealias ItemA = ItemAEntity
        typealias ItemB = ItemBEntity
    }
}
