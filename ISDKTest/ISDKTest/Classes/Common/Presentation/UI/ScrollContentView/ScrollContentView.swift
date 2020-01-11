//
//  ScrollContentView.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation
import Stevia


// MARK: - ScrollContentView -

final class ScrollContentView: UIView {
    
    // MARK: Properties
    
    
    private(set) var scrollView: UIScrollView!
    
    private(set) var contentView: UIView!
    
    
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
            scrollView.contentInset = .zero
            scrollView.scrollIndicatorInsets = .zero
        }
    }
}

// MARK: - Configure UI -

private extension ScrollContentView {
    
    func configureUI() {
        configureViews()
        configureConstraints()
    }
    
    func configureViews() {
        scrollView = UIScrollView()
        contentView = UIView()
        
        sv(scrollView.sv(contentView))
    }
    
    func configureConstraints() {
        scrollView.fillContainer()
        contentView.Trailing == 0
        contentView.Leading == 0
        contentView.Top == 0
        contentView.Bottom == 0
        contentView.Width == scrollView.Width
    }
}
