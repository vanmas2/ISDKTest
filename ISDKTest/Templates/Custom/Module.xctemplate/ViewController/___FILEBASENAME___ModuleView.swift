//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//


import UIKit
import Stevia


// MARK: - ___VARIABLE_sceneName___ModuleView

final class ___VARIABLE_sceneName___ModuleView: UIView {
    
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

private extension ___VARIABLE_sceneName___ModuleView {
    
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

private extension ___VARIABLE_sceneName___ModuleView {
    
    enum View {
        static let backgroundColor = UIColor.blue
    }
}
