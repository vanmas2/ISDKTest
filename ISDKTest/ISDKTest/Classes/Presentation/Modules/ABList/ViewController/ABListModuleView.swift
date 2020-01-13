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

    // MARK: Override functions

    override func layoutSubviews() {
        super.layoutSubviews()
        if #available(iOS 11.0, *) {} else {
            setDefaultTopLayoutGuide()
        }
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
            sortView.Top == safeAreaLayoutGuide.Top + 10
        } else {
            sortView.Top == layoutMarginsGuide.Top + 10
        }
        
        layout(
            10,
            |-20-sortView-20-|,
            10,
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
            addItemAButton.Bottom == safeAreaLayoutGuide.Bottom - 10
        } else {
            addItemAButton.Left == layoutMarginsGuide.Left + 10
            addItemAButton.Bottom == layoutMarginsGuide.Bottom - 10
        }
        
        if #available(iOS 11.0, *) {
            addItemBButton.Right == safeAreaLayoutGuide.Right - 10
            addItemBButton.Bottom == safeAreaLayoutGuide.Bottom - 10
        } else {
            addItemBButton.Right == layoutMarginsGuide.Right - 10
            addItemBButton.Bottom == layoutMarginsGuide.Bottom - 10
        }
        
        if #available(iOS 11.0, *) {
            tableView.contentInset = .init(top: 0, left: 0, bottom: safeAreaInsets.bottom + 54, right: 0)
        } else {
            tableView.contentInset = .init(top: 0, left: 0, bottom: layoutMargins.bottom + 54, right: 0)
        }
        
        addItemAButton.contentEdgeInsets = .init(top: 6, left: 10, bottom: 6, right: 10)
        addItemBButton.contentEdgeInsets = .init(top: 6, left: 10, bottom: 6, right: 10)
        
        sortTextField.width(100)
    }
    
    func configureStyle() {
        style(viewStyle: DefaultTheme.view)
        
        tableView.style(viewStyle: DefaultTheme.view)
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 100
        
        sortView.style(viewStyle: DefaultTheme.sortView)
        
        sortLabel.text = "Sort by:"
        
        sortTextField.style(textFieldStyle: DefaultTheme.sortTextField)
        
        addItemAButton.setTitle("Add Item A", for: .normal)
        addItemAButton.style(buttonStyle: DefaultTheme.addItemButton)
        
        addItemBButton.setTitle("Add Item B", for: .normal)
        addItemBButton.style(buttonStyle: DefaultTheme.addItemButton)
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
