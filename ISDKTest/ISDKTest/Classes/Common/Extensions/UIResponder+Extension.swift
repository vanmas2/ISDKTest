//
//  UIResponder+Extension.swift
//  ISDKTest
//
//  Created by Масальских Иван Сергеевич on 13.01.2020.
//

import UIKit


extension UIResponder {

    public var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }

}
