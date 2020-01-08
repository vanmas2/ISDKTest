//
//  ABListModuleItemAView.swift
//  ISDKTest
//
//  Created by Иван Масальских on 06/01/2020.
//

import UIKit
import Stevia


// MARK: - ABListModuleItemAView

final class ABListModuleItemAView: UIView {
    
    // MARK: Properties
    
    private(set) var titleLabel: UILabel!
    
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

private extension ABListModuleItemAView {
    
    func configureUI() {
        configureViews()
        configureLayout()
        configureStyle()
    }
    
    func configureViews() {
        titleLabel = UILabel()
        sv(titleLabel)
    }
    
    func configureLayout() {
        layout(
            10,
            |-10-titleLabel-10-|,
            10
        )
    }
    
    func configureStyle() {
        itemStyle(self)
        titleLabelStyle(titleLabel)
    }
}

// MARK: - Style

private extension ABListModuleItemAView {
    
    func titleLabelStyle(_ label: UILabel) {
        label.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func itemStyle(_ view: UIView) {
        view.backgroundColor = .red
    }
}
