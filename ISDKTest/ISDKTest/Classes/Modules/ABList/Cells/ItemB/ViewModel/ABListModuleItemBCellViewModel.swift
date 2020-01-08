//
//  ABListModuleItemBCellViewModel.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import Foundation
import RxRelay


// MARK: - ABListModuleItemBCellViewModel

final class ABListModuleItemBCellViewModel {
    
    // MARK: Properties
    
    private var _state: BehaviorRelay<ABListModuleItemBCellViewModelState>
    
    private var _action: PublishRelay<ABListModuleItemBCellViewModeAction>
    
    // MARK: Constructors
    
    init() {
        _state = .init(value: .init(title: "", desc: "", value: "", image: "", labels: ""))
        _action = .init()
    }
    
    convenience init(title: String, desc: String, value: String, image: String, labels: String) {
        self.init()
        _state.accept(.init(title: title, desc: desc, value: value, image: image, labels: labels))
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

