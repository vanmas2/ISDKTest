//
//  CreateItemAModuleView.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//


import UIKit
import Stevia


// MARK: - CreateItemAModuleView

final class CreateItemAModuleView: UIView {
    
    // MARK: Views
    
    private(set) var titleLabel: UILabel!
    
    private(set) var titleErrorLabel: UILabel!
    
    private(set) var titleTextField: UITextField!
    
    private(set) var descLabel: UILabel!
    
    private(set) var descErrorLabel: UILabel!
    
    private(set) var descTextField: UITextField!
    
    private(set) var valueLabel: UILabel!
    
    private(set) var valueErrorLabel: UILabel!
    
    private(set) var valueTextField: UITextField!
    
    private(set) var photoLabel: UILabel!
    
    private(set) var photoButton: UIButton!
    
    // MARK: Constructors
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }
}


// MARK: - Configure UI

private extension CreateItemAModuleView {
    
    func configureUI() {
        configureViews()
        configureLayout()
        configureStyle()
    }
    
    func configureViews() {
        titleLabel = UILabel()
        titleErrorLabel = UILabel()
        titleTextField = UITextField()
        descLabel = UILabel()
        descErrorLabel = UILabel()
        descTextField = UITextField()
        valueLabel = UILabel()
        valueErrorLabel = UILabel()
        valueTextField = UITextField()
        photoLabel = UILabel()
        photoButton = UIButton()
        sv(
            titleLabel,
            titleTextField,
            titleErrorLabel,
            descLabel,
            descTextField,
            descErrorLabel,
            valueLabel,
            valueTextField,
            valueErrorLabel,
            photoLabel,
            photoButton)
        
    }
    
    func configureLayout() {
        if #available(iOS 11.0, *) {
            titleLabel.Top == safeAreaLayoutGuide.Top + 20
        } else {
            titleLabel.Top == layoutMarginsGuide.Top + 20
        }
        
        layout(
            |-20-titleLabel-20-|,
            2,
            |-20-titleTextField-20-|,
            5,
            |-20-titleErrorLabel-20-|,
            20,
            |-20-descLabel-20-|,
            2,
            |-20-descTextField-20-|,
            5,
            |-20-descErrorLabel-20-|,
            20,
            |-20-valueLabel-20-|,
            2,
            |-20-valueTextField-20-|,
            5,
            |-20-valueErrorLabel-20-|,
            20,
            |-20-photoLabel-20-|,
            2,
            |-20-photoButton,
            (>=20)
        )
        
        photoButton.size(75)
    }
    
    func configureStyle() {
        let ErrorLabelStyle = LabelStyle(font: UIFont.systemFont(ofSize: 14), numberOfLines: 0, textColor: .red)
        
        backgroundColor = View.backgroundColor
        
        titleLabel.text = "Title"
        
        titleTextField.style(textFieldStyle: .init(borderStyle: .roundedRect))
        
        titleErrorLabel.text = "Error"
        titleErrorLabel.style(labelStyle: ErrorLabelStyle)
        
        descLabel.text = "Description"
        
        descTextField.style(textFieldStyle: .init(borderStyle: .roundedRect))
        
        descErrorLabel.text = "Error"
        descErrorLabel.style(labelStyle: ErrorLabelStyle)
        
        valueLabel.text = "Value"
        
        valueTextField.style(textFieldStyle: .init(borderStyle: .roundedRect))
        
        valueErrorLabel.text = "Error"
        valueErrorLabel.style(labelStyle: ErrorLabelStyle)
        
        photoLabel.text = "Photo"
        
        photoButton.setImage(UIImage(named: "Icons/noImage"), for: .normal)
    }
}


// MARK: - Constants

private extension CreateItemAModuleView {
    
    enum View {
        static let backgroundColor = UIColor.white
    }
}
