//
//  TextFieldStyle.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import UIKit


// MARK: - TextFieldStyle

struct TextFieldStyle {
    
    // MARK: Properties
    
    let backgroundColor: UIColor?
    
    let borderStyle: UITextField.BorderStyle?
    
    let keyboardType: UIKeyboardType?
    
    let font: UIFont?
    
    // MARK: Constructors
    
    init(backgroundColor: UIColor? = nil, borderStyle: UITextField.BorderStyle? = nil, keyboardType: UIKeyboardType? = nil, font: UIFont? = nil) {
        self.backgroundColor = backgroundColor
        self.borderStyle = borderStyle
        self.keyboardType = keyboardType
        self.font = font
    }
}
