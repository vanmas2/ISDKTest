//
//  ViewStyle.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import UIKit


// MARK: - ViewStyle

struct ViewStyle {
    
    // MARK: Properties
    
    let backgroundColor: UIColor?
    
    let cornerRadius: CGFloat?
    
    // MARK: Constructors
    
    init(backgroundColor: UIColor? = nil, cornerRadius: CGFloat? = nil) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
}
