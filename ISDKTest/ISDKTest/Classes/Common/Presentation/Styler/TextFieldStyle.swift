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
    
    let borderStyle: UITextField.BorderStyle?
    
    // MARK: Constructors
    
    init(borderStyle: UITextField.BorderStyle? = nil) {
        self.borderStyle = borderStyle
    }
}
