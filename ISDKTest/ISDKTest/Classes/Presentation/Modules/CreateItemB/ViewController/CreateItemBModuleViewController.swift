//
//  CreateItemBModuleViewController.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//


import UIKit
import RxSwift
import RxCocoa
import ReactorKit


// MARK: - CreateItemBModuleViewController

final class CreateItemBModuleViewController: ViewController<CreateItemBModuleView> {
    
    // MARK: Private properties
    
    private var viewModel: CreateItemBModuleViewModelProtocol
    
    // MARK: Constructors
    
    init(viewModel: CreateItemBModuleViewModelProtocol) {
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

private extension CreateItemBModuleViewController {
    
    func bindViewModel() {
        
        // Actions
        
        
        // States
        
    }
}

// MARK: Configure

private extension CreateItemBModuleViewController {
    
    func configure() {
        navigationItem.title = "Create Item B"
    }
}
