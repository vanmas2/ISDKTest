//
//  UpdateItemView.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import UIKit
import Stevia


// MARK: - UpdateItemView

final class UpdateItemView: UIView {
    
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
}


// MARK: - Configure UI

private extension UpdateItemView {
    
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
            |-20-createButton-20-|,
            (>=20)
        )
        
        descTextView.height(60)
        photoButton.size(75)
        
        addKeyboardConstraint(for: scrollContentView)
        addKeyboardCancelAction()
    }
    
    func configureStyle() {
        let viewStyle = ViewStyle(backgroundColor: View.backgroundColor)
        let labelStyle = LabelStyle(font: UIFont.systemFont(ofSize: 18), numberOfLines: 1)
        let buttonStyle = ButtonStyle(backgroundColor: .lightGray, cornerRadius: 5)
        let photoButtonStyle = ButtonStyle(cornerRadius: 5)
        
        style(viewStyle: viewStyle)
        
        titleLabel.text = "Title"
        titleLabel.style(labelStyle: labelStyle)
        
        titleTextField.style(textFieldStyle: .init(borderStyle: .roundedRect))
        titleTextField.font = UIFont.systemFont(ofSize: 16)
        
        descLabel.text = "Description"
        descLabel.style(labelStyle: labelStyle)
        
        descTextView.isScrollEnabled = true
        descTextView.layer.borderWidth = 0.5
        descTextView.layer.borderColor = UIColor.lightGray.cgColor
        descTextView.layer.cornerRadius = 5
        descTextView.font = UIFont.systemFont(ofSize: 16)
        
        valueLabel.text = "Value"
        valueLabel.style(labelStyle: labelStyle)
        
        valueTextField.style(textFieldStyle: .init(borderStyle: .roundedRect))
        valueTextField.keyboardType = .numberPad
        valueTextField.font = UIFont.systemFont(ofSize: 16)
        
        photoLabel.text = "Photo"
        photoLabel.style(labelStyle: labelStyle)
        
        photoButton.style(buttonStyle: photoButtonStyle)
        photoButton.clipsToBounds = true
        
        createButton.setTitle("Confirm", for: .normal)
        createButton.style(buttonStyle: buttonStyle)
    }
}


// MARK: - Constants

private extension UpdateItemView {
    
    enum View {
        static let backgroundColor = UIColor.white
    }
}
