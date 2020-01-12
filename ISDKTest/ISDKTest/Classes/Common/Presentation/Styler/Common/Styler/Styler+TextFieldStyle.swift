//
//  Styler+TextFieldStyle.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import UIKit


extension Styler {
    
    func textFieldStyle(_ textField: UITextField, style: TextFieldStyle) {
        if let borderStyle = style.borderStyle {
            textField.borderStyle = borderStyle
        }
        
        if let font = style.font {
            textField.font = font
        }
        
        if let keyboardType = style.keyboardType {
            textField.keyboardType = keyboardType
        }
        
        if let backgroundColor = style.backgroundColor {
            textField.backgroundColor = backgroundColor
        }
    }
}

extension UITextField {
    
    func style(textFieldStyle: TextFieldStyle) {
        Styler.shared.textFieldStyle(self, style: textFieldStyle)
    }
}
