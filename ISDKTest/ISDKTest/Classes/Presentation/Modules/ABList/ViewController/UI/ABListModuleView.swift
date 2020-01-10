//
//  ABListModuleView.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import UIKit
import Stevia


// MARK: - ABListModuleView

final class ABListModuleView: UIView {
    
    // MARK: Views
    
    private(set) var sortView: UIView!
    
    private(set) var sortLabel: UILabel!
    
    private(set) var sortTextField: UITextField!
    
    private(set) var sortPickerView: UIPickerView!
    
    private(set) var tableView: UITableView!
    
    private(set) var addItemAButton: UIButton!
    
    private(set) var addItemBButton: UIButton!
    
    
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

private extension ABListModuleView {
    
    func configureUI() {
        configureViews()
        configureLayout()
        configureStyle()
    }
    
    func configureViews() {
        sortView = UIView()
        sortLabel = UILabel()
        sortTextField = UITextField()
        sortPickerView = UIPickerView()
        tableView = UITableView()
        addItemAButton = UIButton()
        addItemBButton = UIButton()
        sv(
            sortView.sv(sortLabel, sortTextField),
            tableView,
            addItemAButton,
            addItemBButton
        )
        
        tableView.register(ABListModuleItemACell.self, forCellReuseIdentifier: ABListModuleItemACell.reuseIdentifier)
        tableView.register(ABListModuleItemBCell.self, forCellReuseIdentifier: ABListModuleItemBCell.reuseIdentifier)
        
        configurePickerView()
    }
    
    func configureLayout() {
        if #available(iOS 11.0, *) {
            sortView.Top == safeAreaLayoutGuide.Top
        } else {
            sortView.Top == layoutMarginsGuide.Top
        }
        
        layout(
            |sortView|,
            0,
            |tableView|,
            0
        )
        
        sortView.layout(
            10,
            |-10-sortLabel-10-sortTextField,
            10
        )
        
        if #available(iOS 11.0, *) {
            addItemAButton.Left == safeAreaLayoutGuide.Left + 10
            addItemAButton.Bottom == safeAreaLayoutGuide.Bottom + 10
        } else {
            addItemAButton.Left == layoutMarginsGuide.Left + 10
            addItemAButton.Bottom == layoutMarginsGuide.Bottom + 10
        }
        
        if #available(iOS 11.0, *) {
            addItemBButton.Right == safeAreaLayoutGuide.Right - 10
            addItemBButton.Bottom == safeAreaLayoutGuide.Bottom + 10
        } else {
            addItemBButton.Right == layoutMarginsGuide.Right - 10
            addItemBButton.Bottom == layoutMarginsGuide.Bottom + 10
        }
        
        sortTextField.width(100)
    }
    
    func configureStyle() {
        backgroundColor = View.backgroundColor
        
        tableView.backgroundColor = View.backgroundColor
        tableView.separatorStyle = .none
        tableView.contentInset = .init(top: 0, left: 0, bottom: 34, right: 0)
        
        sortLabel.text = "Sort by:"
        
        sortTextField.borderStyle = .roundedRect
        sortTextField.backgroundColor = .green
        
        addItemAButton.setTitle("Add Item A", for: .normal)
        addItemAButton.backgroundColor = .gray
        
        addItemBButton.setTitle("Add Item B", for: .normal)
        addItemBButton.backgroundColor = .lightGray
    }
    
    func configurePickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.isUserInteractionEnabled = true
        toolBar.isTranslucent = true
        
        let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTap))
        toolBar.setItems([button], animated: true)
        
        sortTextField.inputAccessoryView = toolBar
        sortTextField.inputView = sortPickerView
    }
    
    @objc
    func doneButtonTap() {
        endEditing(true)
    }
}


// MARK: - Constants

private extension ABListModuleView {
    
    enum View {
        static let backgroundColor = UIColor.blue
    }
    
    //    enum LogoView {
    //        static let size: CGFloat = 100
    //    }
}

//extension ABListModuleView: UITextFieldDelegate {}
