//
//  SpecificViewController.swift
//  ISDKTest
//
//  Created by Иван Масальских on 07/01/2020.
//

import UIKit


protocol SpecificViewController {
    associatedtype RootView: UIView
}

extension SpecificViewController where Self: UIViewController {
    
    func view() -> RootView {
        return view as! RootView
    }
}
