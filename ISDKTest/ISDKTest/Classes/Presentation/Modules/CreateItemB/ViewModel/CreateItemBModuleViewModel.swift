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
    
    private let createItemBUseCase: CreateItemBUseCaseProtocol
    
    private var output: Output
    
    private var disposeBag = DisposeBag()
    
    // MARK: Constructors
    
    init(createItemBUseCase: CreateItemBUseCaseProtocol) {
        self.createItemBUseCase = createItemBUseCase
        output = Output()
    }
}

// MARK: - Reactor

extension CreateItemBModuleViewModel: Reactor {
    
    // MARK: Typealias
    
    typealias Action = CreateItemBModuleViewModelAction
    
    typealias Mutation = Action
    
    typealias State = CreateItemBModuleViewModelState
    
    // MARK: Properties
    
    var initialState: CreateItemBModuleViewModelState {
        return CreateItemBModuleViewModelState(title: String.random(length: 20), desc: String.random(length: 100), value: Int.random(in: 0...500), imageData: Data(imageName: "Icons/noImage"), labels: "")
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
        case .setLabels(let labels):
            return Observable.just(.setLabels(labels))
        case .create:
            guard
                currentState.title.count > 0,
                currentState.desc.count > 0,
                currentState.title.count <= 50,
                currentState.desc.count <= 300
                else { return Observable.empty() }
            return createItemBUseCase.execute(request: .init(title: currentState.title, desc: currentState.desc, value: currentState.value, image: currentState.imageData, labels: currentState.labels.components(separatedBy: " ")))
                .map { _ in .create }
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
        case .setLabels(let labels):
            newState.labels = labels
        case .create:
            output.didFinish?()
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
