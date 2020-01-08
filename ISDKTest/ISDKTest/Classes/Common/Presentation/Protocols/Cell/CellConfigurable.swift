//
//  CellConfigurable.swift
//  ISDKTest
//
//  Created by Иван Масальских on 07/01/2020.
//

import Foundation


protocol CellConfigurable {
    func configure(withCellViewModel cellViewModel: CellViewModelProtocol)
}
