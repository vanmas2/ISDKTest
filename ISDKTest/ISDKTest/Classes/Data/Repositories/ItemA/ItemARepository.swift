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

private extension ItemARepository {
    
    enum Stub {
        static let items = [
            ItemAEntity(id: "0", title: "A A One One One One One One One", desc: "One desc One desc One desc One desc One desc One desc", value: 123456789, image: Data(imageName: "Icons/noImage")),
            ItemAEntity(id: "1", title: "B A Two Two Two Two v Two Two Two Two Two v Two Two Two Two v v Two", desc: "Two desc Two desc Two desc Two desc Two desc Two desc Two desc Two desc v Two desc Two desc", value: 123456789101112, image: Data(imageName: "Icons/noImage")),
            ItemAEntity(id: "2", title: "C A Three Three", desc: "Three desc", value: 123, image: Data(imageName: "Icons/noImage"))
        ]
    }
}
