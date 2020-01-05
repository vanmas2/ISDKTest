//
//  Presentable.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import UIKit


// MARK: - Presentable

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    
    func toPresent() -> UIViewController? {
        return self
    }
}
