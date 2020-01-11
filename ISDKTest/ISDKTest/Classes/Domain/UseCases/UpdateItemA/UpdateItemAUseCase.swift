//
//  UpdateItemAUseCase.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation
import RxSwift


// MARK: - UpdateItemAUseCase

final class UpdateItemAUseCase {
    
    // MARK: Properties
    
    private let itemsARepository: ItemARepositoryProtocol
    
    // MARK: Constructors
    
    init(itemsARepository: ItemARepositoryProtocol) {
        self.itemsARepository = itemsARepository
    }
}

extension UpdateItemAUseCase: UpdateItemAUseCaseProtocol {
    
    func execute(request: UpdateItemAUseCaseModels.Request) -> Observable<UpdateItemAUseCaseModels.Response> {
        return itemsARepository.updateItem(request)
    }
}
