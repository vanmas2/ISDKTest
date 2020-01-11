//
//  ItemALocalStorageProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation
import RxSwift


protocol ItemALocalStorageProtocol {
    func readAllItemA() -> Observable<[ItemAEntity]>
    func readItemA(id: String) -> Observable<ItemAEntity?>
    func createItemA(title: String, desc: String, value: Int, image: Data) -> Observable<ItemAEntity?>
    func updateItemA(_ itemA: ItemAEntity) -> Observable<Void>
    func removeItemA(_ itemA: ItemAEntity) -> Observable<Void>
}
