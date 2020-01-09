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
    
    private(set) var sortPickerView: UIPickerView!
    
    private(set) var tableView: UITableView!
    
    
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
        sortPickerView = UIPickerView()
        tableView = UITableView()
        tableView.register(ABListModuleItemACell.self, forCellReuseIdentifier: ABListModuleItemACell.reuseIdentifier)
        tableView.register(ABListModuleItemBCell.self, forCellReuseIdentifier: ABListModuleItemBCell.reuseIdentifier)
        sv(sortPickerView, tableView)
    }
    
    func configureLayout() {
        layout(
            0,
            |sortPickerView|,
            0,
            |tableView|,
            0
        )
    }
    
    func configureStyle() {
        backgroundColor = View.backgroundColor
        
        tableView.separatorStyle = .none
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
