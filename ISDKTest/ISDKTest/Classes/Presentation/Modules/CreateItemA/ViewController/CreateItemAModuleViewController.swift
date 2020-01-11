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
        
        view().titleTextField.rx
            .text
            .filterNil()
            .map { CreateItemAModuleViewModelAction.setTitle($0) }
            .bind(to: viewModel.vmAction)
            .disposed(by: disposeBag)
        
        view().descTextField.rx
            .text
            .filterNil()
            .map { CreateItemAModuleViewModelAction.setDesc($0) }
            .bind(to: viewModel.vmAction)
            .disposed(by: disposeBag)
        
        view().valueTextField.rx
            .text
            .filterNil()
            .map { CreateItemAModuleViewModelAction.setValue($0) }
            .bind(to: viewModel.vmAction)
            .disposed(by: disposeBag)
        
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
            }
            .map { info in
                return info[.originalImage] as? UIImage
            }
            .filterNil()
            .map { $0.jpegData(compressionQuality: 0) }
            .filterNil()
            .map { CreateItemAModuleViewModelAction.setImageData($0) }
            .bind(to: viewModel.vmAction)
            .disposed(by: disposeBag)
        
        view().createButton.rx
            .tap
            .map { CreateItemAModuleViewModelAction.create }
            .bind(to: viewModel.vmAction)
            .disposed(by: disposeBag)
        
        // States
        
        viewModel.vmState
            .map { $0.title }
            .distinctUntilChanged()
            .bind(to: view().titleTextField.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.vmState
            .map { $0.desc }
            .distinctUntilChanged()
            .bind(to: view().descTextField.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.vmState
            .map { $0.value }
            .distinctUntilChanged()
            .bind(to: view().valueTextField.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.vmState
            .map { $0.imageData }
            .distinctUntilChanged()
            .map { UIImage(data: $0) }
            .bind(to: view().photoButton.rx.image())
            .disposed(by: disposeBag)
    }
}

// MARK: Configure

private extension CreateItemAModuleViewController {
    
    func configure() {
        navigationItem.title = "Create Item A"

    }
}
