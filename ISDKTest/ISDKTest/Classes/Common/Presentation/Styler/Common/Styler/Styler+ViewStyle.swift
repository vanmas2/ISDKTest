//
//  Styler+ViewStyle.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import UIKit


extension Styler {
    
    func viewStyle(_ view: UIView, style: ViewStyle) {
        if let backgroundColor = style.backgroundColor {
            view.backgroundColor = backgroundColor
        }
        
        if let cornerRadius = style.cornerRadius {
            view.layer.cornerRadius = cornerRadius
        }
    }
}

extension UIView {
    
    func style(viewStyle: ViewStyle) {
        Styler.shared.viewStyle(self, style: viewStyle)
    }
}
