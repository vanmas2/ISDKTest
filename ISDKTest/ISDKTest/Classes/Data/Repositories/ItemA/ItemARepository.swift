//
//  ItemARepository.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import Foundation
import RxSwift


// MARK: - ItemARepository

final class ItemARepository {
    
    // MARK: Private properties
    
    private let localStorage: ItemALocalStorageProtocol
    
    // MARK: Constructors
    
    init(localStorage: ItemALocalStorageProtocol) {
        self.localStorage = localStorage
    }
}

extension ItemARepository: ItemARepositoryProtocol {
    
    func createItem(title: String, desc: String, value: Int, image: Data) -> Observable<ItemAEntity?> {
        return localStorage.createItemA(title: title, desc: desc, value: value, image: image)
    }
    
    func getAllItems() -> Observable<[ItemAEntity]> {
        return localStorage.readAllItemA()
    }
    
    func getItem(id: String) -> Observable<ItemAEntity?> {
        return localStorage.readItemA(id: id)
    }
    func updateItem(_ item: ItemAEntity) -> Observable<Void> {
        return localStorage.updateItemA(item)
    }
    
}
