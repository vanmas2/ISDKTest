//
//  ItemAModuleView.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import UIKit
import Stevia


// MARK: - ItemAModuleView

final class ItemAModuleView: UIView {
    
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

    // MARK: Override functions
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if #available(iOS 11.0, *) {} else {
            setDefaultTopLayoutGuide()
        }
    }
}


// MARK: - Configure UI

private extension ItemAModuleView {
    
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
            createButton
        )
        
        titleTextField.delegate = self
        valueTextField.delegate = self
        descTextView.delegate = self
    }
    
    func configureLayout() {
        scrollContentView.fillContainer()

        if #available(iOS 11.0, *) {
            scrollContentView.Top == safeAreaLayoutGuide.Top
        } else {
            scrollContentView.Top == layoutMarginsGuide.Top
        }
        
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
            |-20-createButton-20-|,
            (>=20)
        )
        
        descTextView.height(60)
        photoButton.size(75)
        
        addKeyboardConstraint(for: scrollContentView)
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
        
        createButton.setTitle("Confirm", for: .normal)
        createButton.style(buttonStyle: DefaultTheme.button)
    }
}

// MARK: - UITextFieldDelegate

extension ItemAModuleView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if(textField == titleTextField){
            let newText = textField.text! + string
            return newText.count <= Defaults.titleTextFieldMaxLength
        }
        
        if(textField == valueTextField){
            let newText = textField.text! + string
            return newText.count <= Defaults.valueTextFieldMaxLength
        }

        return true;
    }
}

// MARK: - UITextFieldDelegate

extension ItemAModuleView: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(textView == descTextView){
            let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
            return newText.count <= Defaults.descTextViewMaxLength
        }
        
        return true
    }
}

// MARK: - Constants

private extension ItemAModuleView {
    
    enum Defaults {
        static let titleTextFieldMaxLength = 50
        static let descTextViewMaxLength = 300
        static let valueTextFieldMaxLength = 100
    }
}
