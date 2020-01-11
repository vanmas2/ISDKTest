//
//  GetItemAUseCase.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation
import RxSwift


// MARK: - GetItemAUseCase

final class GetItemAUseCase {
    
    // MARK: Properties
    
    private let itemsARepository: ItemARepositoryProtocol
    
    // MARK: Constructors
    
    init(itemsARepository: ItemARepositoryProtocol) {
        self.itemsARepository = itemsARepository
    }
}

extension GetItemAUseCase: GetItemAUseCaseProtocol {
    
    func execute(request: GetItemAUseCaseModels.Request) -> Observable<GetItemAUseCaseModels.Response> {
        return itemsARepository.getItem(id: request.id)
    }
}
