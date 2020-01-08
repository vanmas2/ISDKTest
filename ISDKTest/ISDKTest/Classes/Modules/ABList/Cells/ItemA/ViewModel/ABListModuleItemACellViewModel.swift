//
//  ABListModuleItemACellViewModel.swift
//  ISDKTest
//
//  Created by Иван Масальских on 06/01/2020.
//

import Foundation
import RxRelay


// MARK: - ABListModuleItemACellViewModel

final class ABListModuleItemACellViewModel {
    
    // MARK: Properties
    
    private var _state: BehaviorRelay<ABListModuleItemACellViewModelState>
    
    private var _action: PublishRelay<ABListModuleItemACellViewModeAction>
    
    // MARK: Constructors
    
    init() {
        _state = .init(value: .init(title: ""))
        _action = .init()
    }
    
    convenience init(title: String) {
        self.init()
        _state.accept(.init(title: title))
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
