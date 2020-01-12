//
//  CreateItemBUseCase.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import Foundation
import RxSwift


// MARK: - CreateItemBUseCase

final class CreateItemBUseCase {
    
    // MARK: Properties
    
    private let itemBRepository: ItemBRepositoryProtocol
    
    // MARK: Constructors
    
    init(itemBRepository: ItemBRepositoryProtocol) {
        self.itemBRepository = itemBRepository
    }
}

extension CreateItemBUseCase: CreateItemBUseCaseProtocol {
    
    func execute(request: CreateItemBUseCaseModels.Request) -> Observable<CreateItemBUseCaseModels.Response> {
        return itemBRepository.createItem(title: request.title, desc: request.desc, value: request.value, image: request.image, labels: request.labels).map { _ in .init() }
    }
}
