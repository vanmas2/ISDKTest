//
//  ItemARepositoryProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import Foundation
import RxSwift


protocol ItemARepositoryProtocol {
    func getAllItems() -> Observable<[ItemAEntity]>
    func getItem(id: String) -> Observable<ItemAEntity?>
    func createItem(title: String, desc: String, value: Int, image: Data) -> Observable<ItemAEntity?>
    func updateItem(_ item: ItemAEntity) -> Observable<Void>
}
