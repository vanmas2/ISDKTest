//
//  DefaultTheme.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import UIKit


enum DefaultTheme {
    
    static let view = ViewStyle(
        backgroundColor: .white
    )
    
    static let label = LabelStyle(
        font: UIFont.systemFont(ofSize: 18),
        numberOfLines: 1
    )
    
    static let button = ButtonStyle(
        backgroundColor: .lightGray,
        cornerRadius: 5
    )
    
    static let photoButton = ButtonStyle(
        cornerRadius: 5
    )
    
    static let textField = TextFieldStyle(
        borderStyle: .roundedRect,
        font: UIFont.systemFont(ofSize: 16)
    )
    
    static let valueTextField = TextFieldStyle(
        borderStyle: .roundedRect,
        keyboardType: .numberPad,
        font: UIFont.systemFont(ofSize: 16)
    )
    
    static let textView = TextViewStyle(
        borderWidth: 0.5,
        borderColor: .lightGray,
        cornerRadius: 5,
        font: UIFont.systemFont(ofSize: 16)
    )
    
    static let sortView = ViewStyle(
        backgroundColor: .lightGray,
        cornerRadius: 5
    )
    
    static let sortTextField = TextFieldStyle(
        backgroundColor: .lightGray,
        borderStyle: .roundedRect,
        font: UIFont.systemFont(ofSize: 16)
    )
    
    static let addItemButton = ButtonStyle(
        backgroundColor: .lightGray,
        cornerRadius: 5
    )
}
