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
        
        view().titleTextField.rx
            .text
            .filterNil()
            .filter { $0.count > 0 }
            .map { CreateItemBModuleViewModelAction.setTitle($0) }
            .bind(to: viewModel.vmAction)
            .disposed(by: disposeBag)
        
        view().descTextView.rx
            .text
            .filterNil()
            .filter { $0.count > 0 }
            .map { CreateItemBModuleViewModelAction.setDesc($0) }
            .bind(to: viewModel.vmAction)
            .disposed(by: disposeBag)
        
        view().valueTextField.rx
            .text
            .filterNil()
            .map { Int($0) }
            .filterNil()
            .map { CreateItemBModuleViewModelAction.setValue($0) }
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
            .map { $0.convert(toSize: CGSize(width: 75, height: 75), scale: 1) }
            .map { $0.jpegData(compressionQuality: 0) }
            .filterNil()
            .map { CreateItemBModuleViewModelAction.setImageData($0) }
            .bind(to: viewModel.vmAction)
            .disposed(by: disposeBag)
        
        view().createButton.rx
            .tap
            .map { CreateItemBModuleViewModelAction.create }
            .bind(to: viewModel.vmAction)
            .disposed(by: disposeBag)
        
        view().labelsTextField.rx
            .text
            .filterNil()
            .map { CreateItemBModuleViewModelAction.setLabels($0) }
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
            .bind(to: view().descTextView.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.vmState
            .map { $0.value.description }
            .distinctUntilChanged()
            .bind(to: view().valueTextField.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.vmState
            .map { $0.imageData }
            .distinctUntilChanged()
            .map { UIImage(data: $0) }
            .bind(to: view().photoButton.rx.image())
            .disposed(by: disposeBag)
        
        viewModel.vmState
            .map { $0.labels }
            .distinctUntilChanged()
            .bind(to: view().labelsTextField.rx.text)
            .disposed(by: disposeBag)
    }
}

// MARK: Configure

private extension CreateItemBModuleViewController {
    
    func configure() {
        navigationItem.title = "Create Item B"
    }
}
