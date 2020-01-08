//
//  LabelStyle.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import UIKit


// MARK: - LabelStyle

struct LabelStyle {
    
    // MARK: Properties
    
    let font: UIFont?
    
    let numberOfLines: Int?
    
    let lineBreakMode: NSLineBreakMode?
    
    // MARK: Constructors
    
    init(font: UIFont? = nil,
         numberOfLines: Int? = nil,
         lineBreakMode: NSLineBreakMode? = nil) {
        self.font = font
        self.numberOfLines = numberOfLines
        self.lineBreakMode = lineBreakMode
    }
}
