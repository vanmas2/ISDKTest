//
//  ItemBRepositoryProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import Foundation
import RxSwift


protocol ItemBRepositoryProtocol {
    func getAllItems() -> Observable<[ItemBEntity]>
    func getItem(id: String) -> Observable<ItemBEntity?>
    func createItem(title: String, desc: String, value: Int, image: Data, labels: [String]) -> Observable<ItemBEntity?>
    func updateItem(_ item: ItemBEntity) -> Observable<Void>
}
