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
    func getItem(id: Int) -> Observable<ItemAEntity?>
}
