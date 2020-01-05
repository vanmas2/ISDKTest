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
    
    //    var logoView: LogoUIView!
    
    
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
        //        logoView = LogoUIView()
        //        sv(logoView)
    }
    
    func configureLayout() {
        //        logoView.centerInContainer().width(LogoView.size).height(LogoView.size)
    }
    
    func configureStyle() {
        backgroundColor = View.backgroundColor
    }
}


// MARK: - Constants

private extension ABListModuleView {
    
    enum View {
        static let backgroundColor = UIColor.red
    }
    
    //    enum LogoView {
    //        static let size: CGFloat = 100
    //    }
}
