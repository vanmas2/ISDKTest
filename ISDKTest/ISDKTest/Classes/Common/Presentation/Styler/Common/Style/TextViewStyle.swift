//
//  TextViewStyle.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import UIKit


// MARK: - TextViewStyle

struct TextViewStyle {
    
    // MARK: Properties
    
    let borderWidth: CGFloat?
    
    let borderColor: UIColor?
    
    let cornerRadius: CGFloat?
    
    let font: UIFont?
    
    // MARK: Constructors
    
    init(borderWidth: CGFloat? = nil, borderColor: UIColor? = nil, cornerRadius: CGFloat? = nil, font: UIFont? = nil) {
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.cornerRadius = cornerRadius
        self.font = font
    }
}
