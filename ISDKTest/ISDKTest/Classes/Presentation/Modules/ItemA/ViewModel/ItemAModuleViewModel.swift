//
//  ItemAModuleViewModel.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//


import Foundation
import RxSwift
import RxCocoa
import ReactorKit


// MARK: - ItemAModuleViewModel

final class ItemAModuleViewModel {
    
    // MARK: Private properties
    
    private var output: Output
    
    private var disposeBag = DisposeBag()
    
    // MARK: Constructors
    
    init() {
        output = Output()
    }
}

// MARK: - Reactor

extension ItemAModuleViewModel: Reactor {
    
    // MARK: Typealias
    
    typealias Action = ItemAModuleViewModelAction
    
    typealias Mutation = ItemAModuleViewModelMutation
    
    typealias State = ItemAModuleViewModelState
    
    // MARK: Properties
    
    var initialState: ItemAModuleViewModelState {
        return ItemAModuleViewModelState()
    }
    
    // MARK: Functions
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        default:
            return Observable.empty()
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        default:
            ()
        }
        
        return newState
    }
}

// MARK: - Helper functions

private extension  ItemAModuleViewModel {
    
}

// MARK: -  ItemAModuleViewModelProtocol

extension  ItemAModuleViewModel:  ItemAModuleViewModelProtocol {
    
    var vmAction: ActionSubject< ItemAModuleViewModelAction> {
        return action
    }
    
    var vmState: Observable< ItemAModuleViewModelState> {
        return state
    }
}

// MARK: -  ItemAModuleIntput

extension  ItemAModuleViewModel:  ItemAModuleIntput {}

// MARK: -  ItemAModuleOutput

extension  ItemAModuleViewModel:  ItemAModuleOutput {
    
    var didFinish: (() -> Void)? {
        get { return output.didFinish }
        set { output.didFinish = newValue }
    }
}

// MARK: - Helper types

private extension  ItemAModuleViewModel {
    
    struct Output {
        var didFinish: (() -> Void)?
    }
}
