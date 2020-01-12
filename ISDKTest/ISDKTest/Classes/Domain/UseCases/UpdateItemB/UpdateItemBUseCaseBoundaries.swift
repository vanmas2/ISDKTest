//
//  UpdateItemBUseCaseBoundaries.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import Foundation
import RxSwift


protocol UpdateItemBUseCaseProtocol {
    func execute(request: UpdateItemBUseCaseModels.Request) -> Observable<UpdateItemBUseCaseModels.Response>
}

enum UpdateItemBUseCaseModels {
    
    typealias Request  = ItemBEntity
    
    typealias Response = Void
}
