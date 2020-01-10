//
//  CreateItemAModuleViewController.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//


import UIKit
import RxSwift
import RxCocoa
import ReactorKit


// MARK: - CreateItemAModuleViewController

final class CreateItemAModuleViewController: ViewController<CreateItemAModuleView> {
    
    // MARK: Private properties
    
    private var viewModel: CreateItemAModuleViewModelProtocol
    
    // MARK: Constructors
    
    init(viewModel: CreateItemAModuleViewModelProtocol) {
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

private extension CreateItemAModuleViewController {
    
    func bindViewModel() {
        
        // Actions
        
        
        // States
        
    }
}

// MARK: Configure

private extension CreateItemAModuleViewController {
    
    func configure() {
        navigationItem.title = "Create Item A"
    }
}
