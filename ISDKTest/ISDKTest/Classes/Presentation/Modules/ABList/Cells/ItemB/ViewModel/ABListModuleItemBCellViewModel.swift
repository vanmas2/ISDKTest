//
//  ABListModuleItemBCellViewModel.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import Foundation
import RxSwift
import RxRelay


// MARK: - ABListModuleItemBCellViewModel

final class ABListModuleItemBCellViewModel {
    
    // MARK: Properties
    
    private var viewModel: ABListModuleViewModelProtocol
    
    private var id: String
    
    private var _state: BehaviorRelay<ABListModuleItemBCellViewModelState>
    
    private var _action: PublishRelay<ABListModuleItemBCellViewModeAction>
    
    private var disposeBag: DisposeBag
    
    // MARK: Constructors
    
    init(id: String, title: String, desc: String, value: String, image: Data, labels: String, viewModel: ABListModuleViewModelProtocol) {
        _state = .init(value: .init(title: title, desc: desc, value: value, image: image, labels: labels))
        _action = .init()
        self.viewModel = viewModel
        self.id = id
        disposeBag = DisposeBag()
        bindViewModel()
    }
    
    private func bindViewModel() {
        _action.filter { $0 == ABListModuleItemBCellViewModeAction.select }
            .map { _ in ABListModuleViewModelAction.selectB(self.id) }
            .bind(to: viewModel.vmAction)
            .disposed(by: disposeBag)
    }
}

// MARK: - ABListModuleItemBCellViewModelProtocol

extension ABListModuleItemBCellViewModel: ABListModuleItemBCellViewModelProtocol {
    
    var state: BehaviorRelay<ABListModuleItemBCellViewModelState> {
        get { return _state }
        set { _state = newValue }
    }
    
    var action: PublishRelay<ABListModuleItemBCellViewModeAction> {
        get { return _action }
        set { _action = newValue }
    }
}

// MARK: - CellViewModelProtocol

extension ABListModuleItemBCellViewModel: CellViewModelProtocol {
    
    var reuseIdentifier: String {
        return ABListModuleItemBCell.reuseIdentifier
    }
    
    var height: Double {
        return ABListModuleItemBCell.height
    }
}

