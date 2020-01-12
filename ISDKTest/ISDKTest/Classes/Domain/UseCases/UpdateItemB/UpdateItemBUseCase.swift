//
//  UpdateItemBUseCase.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import Foundation
import RxSwift


// MARK: - UpdateItemBUseCase

final class UpdateItemBUseCase {
    
    // MARK: Properties
    
    private let itemBRepository: ItemBRepositoryProtocol
    
    // MARK: Constructors
    
    init(itemBRepository: ItemBRepositoryProtocol) {
        self.itemBRepository = itemBRepository
    }
}

extension UpdateItemBUseCase: UpdateItemBUseCaseProtocol {
    
    func execute(request: UpdateItemBUseCaseModels.Request) -> Observable<UpdateItemBUseCaseModels.Response> {
        return itemBRepository.updateItem(request)
    }
}
