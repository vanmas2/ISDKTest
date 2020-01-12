//
//  Styler+ButtonStyle.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import UIKit


extension Styler {
    
    func buttonStyle(_ button: UIButton, style: ButtonStyle) {
        if let title = style.title {
            button.setTitle(title, for: .normal)
        }
        
        if let backgroundColor = style.backgroundColor {
            button.backgroundColor = backgroundColor
        }
        
        if let cornerRadius = style.cornerRadius {
            button.layer.cornerRadius = cornerRadius
        }
    }
}

extension UIButton {
    
    func style(buttonStyle: ButtonStyle) {
        Styler.shared.buttonStyle(self, style: buttonStyle)
    }
}
