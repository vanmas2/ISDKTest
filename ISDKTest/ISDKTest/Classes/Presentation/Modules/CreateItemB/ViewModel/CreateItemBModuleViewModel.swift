//
//  CreateItemBModuleViewModel.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//


import Foundation
import RxSwift
import RxCocoa
import ReactorKit


// MARK: - CreateItemBModuleViewModel

final class CreateItemBModuleViewModel {
    
    // MARK: Private properties
    
    private var output: Output
    
    private var disposeBag = DisposeBag()
    
    // MARK: Constructors
    
    init() {
        output = Output()
    }
}

// MARK: - Reactor

extension CreateItemBModuleViewModel: Reactor {
    
    // MARK: Typealias
    
    typealias Action = CreateItemBModuleViewModelAction
    
    typealias Mutation = CreateItemBModuleViewModelMutation
    
    typealias State = CreateItemBModuleViewModelState
    
    // MARK: Properties
    
    var initialState: CreateItemBModuleViewModelState {
        return CreateItemBModuleViewModelState()
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

private extension  CreateItemBModuleViewModel {
    
}

// MARK: -  CreateItemBModuleViewModelProtocol

extension  CreateItemBModuleViewModel:  CreateItemBModuleViewModelProtocol {
    
    var vmAction: ActionSubject< CreateItemBModuleViewModelAction> {
        return action
    }
    
    var vmState: Observable< CreateItemBModuleViewModelState> {
        return state
    }
}

// MARK: -  CreateItemBModuleIntput

extension  CreateItemBModuleViewModel:  CreateItemBModuleIntput {}

// MARK: -  CreateItemBModuleOutput

extension  CreateItemBModuleViewModel:  CreateItemBModuleOutput {
    
    var didFinish: (() -> Void)? {
        get { return output.didFinish }
        set { output.didFinish = newValue }
    }
}

// MARK: - Helper types

private extension  CreateItemBModuleViewModel {
    
    struct Output {
        var didFinish: (() -> Void)?
    }
}
