//
//  ItemBLocalStorageProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import Foundation
import RxSwift


protocol ItemBLocalStorageProtocol {
    func readAllItemB() -> Observable<[ItemBEntity]>
    func readItemB(id: String) -> Observable<ItemBEntity?>
    func createItemB(title: String, desc: String, value: Int, image: Data, labels: [String]) -> Observable<ItemBEntity?>
    func updateItemB(_ itemB: ItemBEntity) -> Observable<Void>
    func removeItemB(_ itemB: ItemBEntity) -> Observable<Void>
}
