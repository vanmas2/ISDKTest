//
//  GetABListUseCase.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import Foundation
import RxSwift


// MARK: - GetABListUseCase

final class GetABListUseCase {
    
    // MARK: Properties
    
    private let itemsARepository: ItemARepositoryProtocol
    
    private let itemsBRepository: ItemBRepositoryProtocol
    
    // MARK: Constructors
    
    init(itemsARepository: ItemARepositoryProtocol, itemsBRepository: ItemBRepositoryProtocol) {
        self.itemsARepository = itemsARepository
        self.itemsBRepository = itemsBRepository
    }
}

extension GetABListUseCase: GetABListUseCaseProtocol {
    
    func execute(request: GetABListUseCaseModels.Request) -> Observable<GetABListUseCaseModels.Response> {
        return Observable.zip(
            itemsARepository.getAllItems()
                .map { $0.map { GetABListUseCaseModels.Response.Item.itemA(.init(id: $0.id, title: $0.title, desc: $0.desc, value: $0.value, image: $0.image)) } },
            itemsBRepository.getAllItems()
                .map { $0.map { GetABListUseCaseModels.Response.Item.itemB(.init(id: $0.id, title: $0.title, desc: $0.desc, value: $0.value, image: $0.image, labels: $0.labels)) } }
        ) { $0 + $1 }
            .map { self.sorted(by: request.sort, items: $0) }
            .map { GetABListUseCaseModels.Response(items: $0) }
    }
}

private extension GetABListUseCase {
    
    func sorted(by sortType: GetABListUseCaseModels.Request.Sort, items: [GetABListUseCaseModels.Response.Item]) -> [GetABListUseCaseModels.Response.Item] {
        return items.sorted(by: { (itemOne, itemTwo) -> Bool in
            switch sortType {
            case .title:
                var itemOneTitle: String!
                var itemTwoTitle: String!
                
                switch itemOne {
                case .itemA(let item):
                    itemOneTitle = item.title
                case .itemB(let item):
                    itemOneTitle = item.title
                }
                
                switch itemTwo {
                case .itemA(let item):
                    itemTwoTitle = item.title
                case .itemB(let item):
                    itemTwoTitle = item.title
                }
                
                return itemOneTitle < itemTwoTitle
                
            case .value:
                var itemOneValue: Int!
                var itemTwoValue: Int!
                
                switch itemOne {
                case .itemA(let item):
                    itemOneValue = item.value
                case .itemB(let item):
                    itemOneValue = item.value
                }
                
                switch itemTwo {
                case .itemA(let item):
                    itemTwoValue = item.value
                case .itemB(let item):
                    itemTwoValue = item.value
                }
                
                return itemOneValue > itemTwoValue
                
            case .aType:
               if case .itemA = itemOne, case .itemB = itemTwo {
                    return true
                }
                
                return false
                
            case .bType:
                if case .itemB = itemOne, case .itemA = itemTwo {
                    return true
                }
                
                return false
            }
        })
    }
}
