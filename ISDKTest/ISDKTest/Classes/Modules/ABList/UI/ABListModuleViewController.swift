//
//  ABListModuleViewController.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import UIKit


// MARK: - ABListModuleViewController

final class ABListModuleViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Private properties
    
//    private var viewModel: AppFeatureViewModelProtocol
    
    // MARK: Constructors
    
//    init(viewModel: AppFeatureViewModelProtocol) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View lifecycle
    
    override func loadView() {
        view = ABListModuleView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    var didFinish: (() -> Void)?
    
    var showAddA: (() -> Void)?
    
    var showAddB: (() -> Void)?
}

extension ABListModuleViewController: ABListModuleIntput {}

extension ABListModuleViewController: ABListModuleOutput {}
