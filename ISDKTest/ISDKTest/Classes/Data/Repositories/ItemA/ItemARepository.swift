//
//  ItemARepository.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import Foundation
import RxSwift


// MARK: - ItemARepository

final class ItemARepository {}

extension ItemARepository: ItemARepositoryProtocol {
    
    func getAllItems() -> Observable<[ItemAEntity]> {
        return Observable.just(Stub.items)
    }
    
    func getItem(id: Int) -> Observable<ItemAEntity?> {
        return Observable.just(Stub.items).map { $0.filter { $0.id == id }.first }
    }
}

private extension ItemARepository {
    
    enum Stub {
        static let items = [
            ItemAEntity(id: 0, title: "A A One One One One One One One", desc: "One desc One desc One desc One desc One desc One desc", value: 123456789, image: "Icons/noImage"),
            ItemAEntity(id: 1, title: "B A Two Two Two Two v Two Two Two Two Two v Two Two Two Two v v Two", desc: "Two desc Two desc Two desc Two desc Two desc Two desc Two desc Two desc v Two desc Two desc", value: 123456789101112, image: "Icons/noImage"),
            ItemAEntity(id: 2, title: "C A Three Three", desc: "Three desc", value: 123, image: "Icons/noImage")
        ]
    }
}
