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

        RxImagePickerDelegateProxy.register { RxImagePickerDelegateProxy(imagePicker: $0) }
        
        view().photoButton.rx.tap
            .flatMap { [weak self] _ in
                return UIImagePickerController.rx.createWithParent(self) { picker in
                        picker.sourceType = .photoLibrary
                        picker.allowsEditing = false
                    }
                    .flatMap {
                        $0.rx.didFinishPickingMediaWithInfo
                    }
                    .take(1)
                    .debug()
            }
            .map { info in
                return info[.originalImage] as? UIImage
            }
            .bind(to: view().photoButton.rx.image())
            .disposed(by: disposeBag)
    }
}
