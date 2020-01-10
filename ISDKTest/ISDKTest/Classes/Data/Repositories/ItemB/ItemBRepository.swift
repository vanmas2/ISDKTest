//
//  ItemBRepository.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import Foundation
import RxSwift


// MARK: - ItemBRepository

final class ItemBRepository {}

extension ItemBRepository: ItemBRepositoryProtocol {
    
    func getAllItems() -> Observable<[ItemBEntity]> {
        return Observable.just(Stub.items)
    }
    
    func getItem(id: Int) -> Observable<ItemBEntity?> {
        return Observable.just(Stub.items).map { $0.filter { $0.id == id }.first }
    }
}

private extension ItemBRepository {
    
    enum Stub {
        static let items = [
            ItemBEntity(id: 0, title: "A B One One One One One One One", desc: "One desc One desc One desc One desc One desc One desc", value: 123456789, image: "Icons/noImage", labels: ["labels", "labels", "labels", "labels", "labels", "labels"]),
            ItemBEntity(id: 1, title: "B B Two Two Two Two v Two Two Two Two Two v Two Two Two Two v v Two", desc: "Two desc Two desc Two desc Two desc Two desc Two desc Two desc Two desc v Two desc Two desc", value: 1234567891011121, image: "Icons/noImage", labels: ["labels"]),
            ItemBEntity(id: 2, title: "C B Three Three", desc: "Three desc", value: 123, image: "Icons/noImage", labels: ["labels", "labels", "labels", "labels", "labels", "labels", "labels", "labels", "labels"]),
            ItemBEntity(id: 3, title: "D B Four Four", desc: "Four desc", value: 123, image: "Icons/noImage", labels: ["labels1", "labels2", "labels3", "labels4", "labels5"])
        ]
    }
}
