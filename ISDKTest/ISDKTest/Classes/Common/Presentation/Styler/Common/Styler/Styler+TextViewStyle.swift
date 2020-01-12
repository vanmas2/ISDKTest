//
//  Styler+TextViewStyle.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import UIKit


extension Styler {
    
    func textViewStyle(_ textView: UITextView, style: TextViewStyle) {
        if let borderColor = style.borderColor {
            textView.layer.borderColor = borderColor.cgColor
        }
        
        if let borderWidth = style.borderWidth {
            textView.layer.borderWidth = borderWidth
        }
        
        if let cornerRadius = style.cornerRadius {
            textView.layer.cornerRadius = cornerRadius
        }
        
        if let font = style.font {
            textView.font = font
        }
    }
}

extension UITextView {
    
    func style(textViewStyle: TextViewStyle) {
        Styler.shared.textViewStyle(self, style: textViewStyle)
    }
}
