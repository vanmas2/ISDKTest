//
//  ItemAModuleViewController.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//


import UIKit
import RxSwift
import RxCocoa
import ReactorKit


// MARK: - ItemAModuleViewController

final class ItemAModuleViewController: ViewController<ItemAModuleView> {
    
    // MARK: Private properties
    
    private var viewModel: ItemAModuleViewModelProtocol
    
    // MARK: Constructors
    
    init(viewModel: ItemAModuleViewModelProtocol) {
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

private extension ItemAModuleViewController {
    
    func bindViewModel() {
        
        // Actions
        
        
        // States
        
    }
}

// MARK: Configure

private extension ItemAModuleViewController {
    
    func configure() {
        navigationItem.title = "Item A"
    }
}
