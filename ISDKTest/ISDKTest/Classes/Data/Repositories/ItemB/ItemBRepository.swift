//
//  ItemBRepository.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import Foundation
import RxSwift


// MARK: - ItemBRepository

final class ItemBRepository {
    
    // MARK: Private properties
    
    private let localStorage: ItemBLocalStorageProtocol
    
    // MARK: Constructors
    
    init(localStorage: ItemBLocalStorageProtocol) {
        self.localStorage = localStorage
    }
}

extension ItemBRepository: ItemBRepositoryProtocol {
    
    func createItem(title: String, desc: String, value: Int, image: Data, labels: [String]) -> Observable<ItemBEntity?> {
        return localStorage.createItemB(title: title, desc: desc, value: value, image: image, labels: labels)
    }
    
    func updateItem(_ item: ItemBEntity) -> Observable<Void> {
        return localStorage.updateItemB(item)
    }
    
    
    func getAllItems() -> Observable<[ItemBEntity]> {
        return localStorage.readAllItemB()
    }
    
    func getItem(id: String) -> Observable<ItemBEntity?> {
        return localStorage.readItemB(id: id)
    }
}
