//
//  ABListModuleItemACellViewModel.swift
//  ISDKTest
//
//  Created by Иван Масальских on 06/01/2020.
//

import Foundation
import RxSwift
import RxRelay


// MARK: - ABListModuleItemACellViewModel

final class ABListModuleItemACellViewModel {
    
    // MARK: Properties
    
    private var viewModel: ABListModuleViewModelProtocol
    
    private var id: String
    
    private var _state: BehaviorRelay<ABListModuleItemACellViewModelState>
    
    private var _action: PublishRelay<ABListModuleItemACellViewModeAction>
    
    private var disposeBag: DisposeBag
    
    // MARK: Constructors
    
    init(id: String, title: String, desc: String, value: String, image: Data, viewModel: ABListModuleViewModelProtocol) {
        _state = .init(value: .init(title: title, desc: desc, value: value, image: image))
        _action = .init()
        self.id = id
        self.viewModel = viewModel
        disposeBag = DisposeBag()
        bindViewModel()
    }
    
    private func bindViewModel() {
        _action.filter { $0 == ABListModuleItemACellViewModeAction.select }
            .map { _ in ABListModuleViewModelAction.selectA(self.id) }
            .bind(to: viewModel.vmAction)
            .disposed(by: disposeBag)
    }
}

// MARK: - ABListModuleItemACellViewModelProtocol

extension ABListModuleItemACellViewModel: ABListModuleItemACellViewModelProtocol {
    
    var state: BehaviorRelay<ABListModuleItemACellViewModelState> {
        get { return _state }
        set { _state = newValue }
    }
    
    var action: PublishRelay<ABListModuleItemACellViewModeAction> {
        get { return _action }
        set { _action = newValue }
    }
}

// MARK: - CellViewModelProtocol

extension ABListModuleItemACellViewModel: CellViewModelProtocol {
    
    var reuseIdentifier: String {
        return ABListModuleItemACell.reuseIdentifier
    }
    
    var height: Double {
        return ABListModuleItemACell.height
    }
}
