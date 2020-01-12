//
//  ItemBModuleView.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import UIKit
import Stevia


// MARK: - ItemBModuleView

final class ItemBModuleView: UIView {
    
    // MARK: Views
    
    private var scrollContentView: ScrollContentView!
    
    private(set) var titleLabel: UILabel!
    
    private(set) var titleTextField: UITextField!
    
    private(set) var descLabel: UILabel!
    
    private(set) var descTextView: UITextView!
    
    private(set) var valueLabel: UILabel!
    
    private(set) var valueTextField: UITextField!
    
    private(set) var photoLabel: UILabel!
    
    private(set) var photoButton: UIButton!
    
    private(set) var labelsLabel: UILabel!
    
    private(set) var labelsTextField: UITextField!
    
    private(set) var createButton: UIButton!
    
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

private extension ItemBModuleView {
    
    func configureUI() {
        configureViews()
        configureLayout()
        configureStyle()
    }
    
    func configureViews() {
        scrollContentView = ScrollContentView()
        titleLabel = UILabel()
        titleTextField = UITextField()
        descLabel = UILabel()
        descTextView = UITextView()
        valueLabel = UILabel()
        valueTextField = UITextField()
        photoLabel = UILabel()
        photoButton = UIButton()
        labelsLabel = UILabel()
        labelsTextField = UITextField()
        createButton = UIButton()
        sv(scrollContentView)
        scrollContentView.contentView.sv(
            titleLabel,
            titleTextField,
            descLabel,
            descTextView,
            valueLabel,
            valueTextField,
            photoLabel,
            photoButton,
            labelsLabel,
            labelsTextField,
            createButton
        )
        
        titleTextField.delegate = self
        valueTextField.delegate = self
    }
    
    func configureLayout() {
        scrollContentView.fillContainer()
        
        scrollContentView.contentView.layout(
            20,
            |-20-titleLabel-20-|,
            2,
            |-20-titleTextField-20-|,
            20,
            |-20-descLabel-20-|,
            2,
            |-20-descTextView-20-|,
            20,
            |-20-valueLabel-20-|,
            2,
            |-20-valueTextField-20-|,
            20,
            |-20-photoLabel-20-|,
            2,
            |-20-photoButton,
            20,
            |-20-labelsLabel-20-|,
            2,
            |-20-labelsTextField-20-|,
            20,
            |-20-createButton-20-|,
            (>=20)
        )
        
        descTextView.height(60)
        photoButton.size(75)
        
        addKeyboardConstraint(for: scrollContentView as Any)
        addKeyboardCancelAction()
    }
    
    func configureStyle() {
        style(viewStyle: DefaultTheme.view)
        
        titleLabel.text = "Title"
        titleLabel.style(labelStyle: DefaultTheme.label)
        
        titleTextField.style(textFieldStyle: DefaultTheme.textField)
        
        descLabel.text = "Description"
        descLabel.style(labelStyle: DefaultTheme.label)
        
        descTextView.style(textViewStyle: DefaultTheme.textView)
        descTextView.isScrollEnabled = true
        
        valueLabel.text = "Value"
        valueLabel.style(labelStyle: DefaultTheme.label)
        
        valueTextField.style(textFieldStyle: DefaultTheme.valueTextField)
        
        photoLabel.text = "Photo"
        photoLabel.style(labelStyle: DefaultTheme.label)
        
        photoButton.style(buttonStyle: DefaultTheme.photoButton)
        photoButton.clipsToBounds = true
        
        labelsLabel.text = "Labels"
        labelsLabel.style(labelStyle: DefaultTheme.label)
        
        labelsTextField.style(textFieldStyle: DefaultTheme.textField)
        
        createButton.setTitle("Confirm", for: .normal)
        createButton.style(buttonStyle: DefaultTheme.button)
    }
}

// MARK: - UITextFieldDelegate

extension ItemBModuleView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if(textField == titleTextField){
            let currentText = textField.text! + string
            return currentText.count <= Defaults.titleTextFieldMaxLength
        }
        
        if(textField == valueTextField){
            let currentText = textField.text! + string
            return currentText.count <= Defaults.valueTextFieldMaxLength
        }
        
        return true;
    }
}

// MARK: - Constants

private extension ItemBModuleView {
    
    enum Defaults {
        static let titleTextFieldMaxLength = 50
        static let descTextViewMaxLength = 300
        static let valueTextFieldMaxLength = 100
    }
}
