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
    func getItem(id: Int) -> Observable<ItemBEntity?>
}
