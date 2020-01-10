//
//  ItemBModuleViewModel.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//


import Foundation
import RxSwift
import RxCocoa
import ReactorKit


// MARK: - ItemBModuleViewModel

final class ItemBModuleViewModel {
    
    // MARK: Private properties
    
    private var output: Output
    
    private var disposeBag = DisposeBag()
    
    // MARK: Constructors
    
    init() {
        output = Output()
    }
}

// MARK: - Reactor

extension ItemBModuleViewModel: Reactor {
    
    // MARK: Typealias
    
    typealias Action = ItemBModuleViewModelAction
    
    typealias Mutation = ItemBModuleViewModelMutation
    
    typealias State = ItemBModuleViewModelState
    
    // MARK: Properties
    
    var initialState: ItemBModuleViewModelState {
        return ItemBModuleViewModelState()
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

private extension  ItemBModuleViewModel {
    
}

// MARK: -  ItemBModuleViewModelProtocol

extension  ItemBModuleViewModel:  ItemBModuleViewModelProtocol {
    
    var vmAction: ActionSubject< ItemBModuleViewModelAction> {
        return action
    }
    
    var vmState: Observable< ItemBModuleViewModelState> {
        return state
    }
}

// MARK: -  ItemBModuleIntput

extension  ItemBModuleViewModel:  ItemBModuleIntput {}

// MARK: -  ItemBModuleOutput

extension  ItemBModuleViewModel:  ItemBModuleOutput {
    
    var didFinish: (() -> Void)? {
        get { return output.didFinish }
        set { output.didFinish = newValue }
    }
}

// MARK: - Helper types

private extension  ItemBModuleViewModel {
    
    struct Output {
        var didFinish: (() -> Void)?
    }
}
