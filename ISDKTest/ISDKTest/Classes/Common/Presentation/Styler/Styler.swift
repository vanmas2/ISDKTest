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
    
    func viewStyle(_ view: UIView, style: ViewStyle) {
        if let backgroundColor = style.backgroundColor {
            view.backgroundColor = backgroundColor
        }
    }
    
    func textFieldStyle(_ textField: UITextField, style: TextFieldStyle) {
        if let borderStyle = style.borderStyle {
            textField.borderStyle = borderStyle
        }
    }
    
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

extension UILabel {
    
    func style(labelStyle: LabelStyle) {
        Styler.shared.labelStyle(self, style: labelStyle)
    }
}

extension UITextField {
    
    func style(textFieldStyle: TextFieldStyle) {
        Styler.shared.textFieldStyle(self, style: textFieldStyle)
    }
}

extension UIButton {
    
    func style(buttonStyle: ButtonStyle) {
        Styler.shared.buttonStyle(self, style: buttonStyle)
    }
}

extension UIView {
    
    func style(viewStyle: ViewStyle) {
        Styler.shared.viewStyle(self, style: viewStyle)
    }
}
