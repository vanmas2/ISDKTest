//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//


import UIKit
import RxSwift
import RxCocoa
import ReactorKit


// MARK: - ___VARIABLE_sceneName___ModuleViewController

final class ___VARIABLE_sceneName___ModuleViewController: ViewController<___VARIABLE_sceneName___ModuleView> {
    
    // MARK: Private properties
    
    private var viewModel: ___VARIABLE_sceneName___ModuleViewModelProtocol
    
    // MARK: Constructors
    
    init(viewModel: ___VARIABLE_sceneName___ModuleViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bindViewModel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - Binding ViewModel

private extension ___VARIABLE_sceneName___ModuleViewController {
    
    func bindViewModel() {
        
        // Actions
        
        
        // States
        
    }
}

// MARK: Configure

private extension ___VARIABLE_sceneName___ModuleViewController {
    
    func configure() {
        
    }
}
