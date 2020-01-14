//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//


import Foundation
import RxSwift
import RxCocoa
import ReactorKit


// MARK: - ___VARIABLE_sceneName___ModuleViewModel

final class ___VARIABLE_sceneName___ModuleViewModel {
    
    // MARK: Private properties
    
    private var output: Output
    
    private var disposeBag = DisposeBag()
    
    // MARK: Constructors
    
    init() {
        output = Output()
    }
}

// MARK: - Reactor

extension ___VARIABLE_sceneName___ModuleViewModel: Reactor {
    
    // MARK: Typealias
    
    typealias Action = ___VARIABLE_sceneName___ModuleViewModelAction
    
    typealias Mutation = ___VARIABLE_sceneName___ModuleViewModelMutation
    
    typealias State = ___VARIABLE_sceneName___ModuleViewModelState
    
    // MARK: Properties
    
    var initialState: ___VARIABLE_sceneName___ModuleViewModelState {
        return ___VARIABLE_sceneName___ModuleViewModelState()
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

private extension  ___VARIABLE_sceneName___ModuleViewModel {
    
}

// MARK: -  ___VARIABLE_sceneName___ModuleViewModelProtocol

extension  ___VARIABLE_sceneName___ModuleViewModel:  ___VARIABLE_sceneName___ModuleViewModelProtocol {
    
    var vmAction: ActionSubject< ___VARIABLE_sceneName___ModuleViewModelAction> {
        return action
    }
    
    var vmState: Observable< ___VARIABLE_sceneName___ModuleViewModelState> {
        return state
    }
}

// MARK: -  ___VARIABLE_sceneName___ModuleIntput

extension  ___VARIABLE_sceneName___ModuleViewModel:  ___VARIABLE_sceneName___ModuleIntput {}

// MARK: -  ___VARIABLE_sceneName___ModuleOutput

extension  ___VARIABLE_sceneName___ModuleViewModel:  ___VARIABLE_sceneName___ModuleOutput {
    
    var didFinish: (() -> Void)? {
        get { return output.didFinish }
        set { output.didFinish = newValue }
    }
}

// MARK: - Helper types

private extension  ___VARIABLE_sceneName___ModuleViewModel {
    
    struct Output {
        var didFinish: (() -> Void)?
    }
}
