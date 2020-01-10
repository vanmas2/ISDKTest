//
//  CreateItemAModuleViewModel.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//


import Foundation
import RxSwift
import RxCocoa
import ReactorKit


// MARK: - CreateItemAModuleViewModel

final class CreateItemAModuleViewModel {
    
    // MARK: Private properties
    
    private var output: Output
    
    private var disposeBag = DisposeBag()
    
    // MARK: Constructors
    
    init() {
        output = Output()
    }
}

// MARK: - Reactor

extension CreateItemAModuleViewModel: Reactor {
    
    // MARK: Typealias
    
    typealias Action = CreateItemAModuleViewModelAction
    
    typealias Mutation = CreateItemAModuleViewModelMutation
    
    typealias State = CreateItemAModuleViewModelState
    
    // MARK: Properties
    
    var initialState: CreateItemAModuleViewModelState {
        return CreateItemAModuleViewModelState()
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

private extension  CreateItemAModuleViewModel {
    
}

// MARK: -  CreateItemAModuleViewModelProtocol

extension  CreateItemAModuleViewModel:  CreateItemAModuleViewModelProtocol {
    
    var vmAction: ActionSubject< CreateItemAModuleViewModelAction> {
        return action
    }
    
    var vmState: Observable< CreateItemAModuleViewModelState> {
        return state
    }
}

// MARK: -  CreateItemAModuleIntput

extension  CreateItemAModuleViewModel:  CreateItemAModuleIntput {}

// MARK: -  CreateItemAModuleOutput

extension  CreateItemAModuleViewModel:  CreateItemAModuleOutput {
    
    var didFinish: (() -> Void)? {
        get { return output.didFinish }
        set { output.didFinish = newValue }
    }
}

// MARK: - Helper types

private extension  CreateItemAModuleViewModel {
    
    struct Output {
        var didFinish: (() -> Void)?
    }
}
