//
//  CreateItemBModuleView.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//


import UIKit
import Stevia


// MARK: - CreateItemBModuleView

final class CreateItemBModuleView: UIView {
    
    // MARK: Views
    
    private(set) var view: UIView!
    
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

private extension CreateItemBModuleView {
    
    func configureUI() {
        configureViews()
        configureLayout()
        configureStyle()
    }
    
    func configureViews() {
        view = UIView()
        sv(view)
    }
    
    func configureLayout() {
        layout(
            0,
            |-0-view-0-|,
            0
        )
    }
    
    func configureStyle() {
        backgroundColor = View.backgroundColor
    }
}


// MARK: - Constants

private extension CreateItemBModuleView {
    
    enum View {
        static let backgroundColor = UIColor.blue
    }
}
