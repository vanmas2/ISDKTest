//
//  UpdateItemAUseCaseBoundaries.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation
import RxSwift


protocol UpdateItemAUseCaseProtocol {
    func execute(request: UpdateItemAUseCaseModels.Request) -> Observable<UpdateItemAUseCaseModels.Response>
}

enum UpdateItemAUseCaseModels {
    
    typealias Request  = ItemAEntity
    
    typealias Response = Void
}
