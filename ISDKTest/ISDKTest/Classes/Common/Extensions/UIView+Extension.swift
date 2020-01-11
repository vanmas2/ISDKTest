//
//  UIView+Extension.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import UIKit


extension UIView {
    
    func addKeyboardConstraint(for item: Any) {
        let bottomCustomConstraint = KeyboardLayoutConstraint(
            item: item,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottom,
            constant: 0.0
        )
        bottomCustomConstraint.isActive = true
        addConstraint(bottomCustomConstraint)
    }
    
    func addKeyboardCancelAction() {
        let tapper = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing(_:)))
        tapper.cancelsTouchesInView = false
        addGestureRecognizer(tapper)
    }
}
