//
//  Module.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import UIKit
import Foundation


// MARK: - Module

protocol Module: Presentable {
    associatedtype Input
    associatedtype Output
    var input: Input { get set }
    var output: Output { get set }
}

