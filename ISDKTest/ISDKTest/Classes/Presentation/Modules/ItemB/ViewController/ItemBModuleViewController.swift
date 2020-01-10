//
//  ItemBModuleViewController.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//


import UIKit
import RxSwift
import RxCocoa
import ReactorKit


// MARK: - ItemBModuleViewController

final class ItemBModuleViewController: ViewController<ItemBModuleView> {
    
    // MARK: Private properties
    
    private var viewModel: ItemBModuleViewModelProtocol
    
    // MARK: Constructors
    
    init(viewModel: ItemBModuleViewModelProtocol) {
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

private extension ItemBModuleViewController {
    
    func bindViewModel() {
        
        // Actions
        
        
        // States
        
    }
}

// MARK: Configure

private extension ItemBModuleViewController {
    
    func configure() {
        navigationItem.title = "Item B"
    }
}
