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
    
    typealias Mutation = Action
    
    typealias State = CreateItemAModuleViewModelState
    
    // MARK: Properties
    
    var initialState: CreateItemAModuleViewModelState {
        return CreateItemAModuleViewModelState(title: "", desc: "", value: "", imageData: Data(imageName: "Icons/noImage"))
    }
    
    // MARK: Functions
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .setTitle(let title):
            return Observable.just(.setTitle(title))
        case .setDesc(let desc):
            return Observable.just(.setDesc(desc))
        case .setValue(let value):
            return Observable.just(.setValue(value))
        case .setImageData(let imageData):
            return Observable.just(.setImageData(imageData))
        case .create:
            // usecase
            return Observable.just(.create)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .setTitle(let title):
            newState.title = title
        case .setDesc(let desc):
            newState.desc = desc
        case .setValue(let value):
            newState.value = value
        case .setImageData(let imageData):
            newState.imageData = imageData
        case .create:
            output.didFinish?()
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
