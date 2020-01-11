//
//  ButtonStyle.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import UIKit


// MARK: - ButtonStyle

struct ButtonStyle {
    
    // MARK: Properties
    
    let title: String?
    
    let backgroundColor: UIColor?
    
    let cornerRadius: CGFloat?
    
    // MARK: Constructors
    
    init(title: String? = nil, backgroundColor: UIColor? = nil, cornerRadius: CGFloat? = nil) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
}
