//
//  Styler+LabelStyle.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import UIKit


extension Styler {
    
    func labelStyle(_ label: UILabel, style: LabelStyle) {
        if let font = style.font {
            label.font = font
        }
        
        if let numberOfLines = style.numberOfLines {
            label.numberOfLines = numberOfLines
        }
        
        if let lineBreakMode = style.lineBreakMode {
            label.lineBreakMode = lineBreakMode
        }
        
        if let textColor = style.textColor {
            label.textColor = textColor
        }
        
        if let adjustsFontSizeToFitWidth = style.adjustsFontSizeToFitWidth {
            label.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        }
        
        if let minimumScaleFactor = style.minimumScaleFactor {
            label.minimumScaleFactor = minimumScaleFactor
        }
    }
}

extension UILabel {
    
    func style(labelStyle: LabelStyle) {
        Styler.shared.labelStyle(self, style: labelStyle)
    }
}
