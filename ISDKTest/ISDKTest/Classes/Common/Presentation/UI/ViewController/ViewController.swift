//
//  ViewController.swift
//  ISDKTest
//
//  Created by Иван Масальских on 07/01/2020.
//

import UIKit


// MARK: - ViewController

class ViewController<View: UIView>: UIViewController {
    
    // MARK: Override functions
    
    override func loadView() {
        view = View()
    }
}

// MARK: - SpecificViewController

extension ViewController: SpecificViewController {
    typealias RootView = View
}
