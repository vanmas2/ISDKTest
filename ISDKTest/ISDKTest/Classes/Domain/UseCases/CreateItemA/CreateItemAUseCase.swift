//
//  CreateItemAUseCase.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation
import RxSwift


// MARK: - CreateItemAUseCase

final class CreateItemAUseCase {
    
    // MARK: Properties
    
    private let itemsARepository: ItemARepositoryProtocol
    
    // MARK: Constructors
    
    init(itemsARepository: ItemARepositoryProtocol) {
        self.itemsARepository = itemsARepository
    }
}

extension CreateItemAUseCase: CreateItemAUseCaseProtocol {
    
    func execute(request: CreateItemAUseCaseModels.Request) -> Observable<CreateItemAUseCaseModels.Response> {
        return itemsARepository.createItem(title: request.title, desc: request.desc, value: request.value, image: request.image).map { _ in .init() }
    }
}
