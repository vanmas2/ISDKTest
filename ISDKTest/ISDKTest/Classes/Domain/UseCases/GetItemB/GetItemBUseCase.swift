//
//  GetItemBUseCase.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import Foundation
import RxSwift


// MARK: - GetItemBUseCase

final class GetItemBUseCase {
    
    // MARK: Properties
    
    private let itemBRepository: ItemBRepositoryProtocol
    
    // MARK: Constructors
    
    init(itemBRepository: ItemBRepositoryProtocol) {
        self.itemBRepository = itemBRepository
    }
}

extension GetItemBUseCase: GetItemBUseCaseProtocol {
    
    func execute(request: GetItemBUseCaseModels.Request) -> Observable<GetItemBUseCaseModels.Response> {
        return itemBRepository.getItem(id: request.id)
    }
}
