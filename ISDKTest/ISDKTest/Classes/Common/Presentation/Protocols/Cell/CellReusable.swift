//
//  CellReusable.swift
//  ISDKTest
//
//  Created by Иван Масальских on 07/01/2020.
//

import Foundation


protocol CellReusable: class {
    static var reuseIdentifier: String { get }
    static var height: Double { get }
}
