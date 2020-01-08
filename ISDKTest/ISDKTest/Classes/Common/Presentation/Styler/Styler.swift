//
//  Styler.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import UIKit


// MARK: - Styler

final class Styler {
    
    static let shared = Styler()
    
    private init() {}
    
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
    }
    
    func viewStyle(_ view: UIView, style: ViewStyle) {
        if let backgroundColor = style.backgroundColor {
            view.backgroundColor = backgroundColor
        }
    }
}

extension UILabel {
    
    func style(labelStyle: LabelStyle) {
        Styler.shared.labelStyle(self, style: labelStyle)
    }
}

extension UIView {
    
    func style(viewStyle: ViewStyle) {
        Styler.shared.viewStyle(self, style: viewStyle)
    }
}
