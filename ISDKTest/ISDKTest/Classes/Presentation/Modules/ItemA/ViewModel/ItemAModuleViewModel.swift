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
    
    private let id: String?
    
    private let updateItemAUseCase: UpdateItemAUseCaseProtocol
    
    private let getItemAUseCase: GetItemAUseCaseProtocol
    
    private let createItemAUseCase: CreateItemAUseCaseProtocol
    
    private var output: Output
    
    private var disposeBag = DisposeBag()
    
    // MARK: Constructors
    
    init(id: String?, getItemAUseCase: GetItemAUseCaseProtocol, updateItemAUseCase: UpdateItemAUseCaseProtocol, createItemAUseCase: CreateItemAUseCaseProtocol) {
        self.getItemAUseCase = getItemAUseCase
        self.updateItemAUseCase = updateItemAUseCase
        self.createItemAUseCase = createItemAUseCase
        self.id = id
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
        return ItemAModuleViewModelState(title: "", desc: "", value: 0, imageData: Data())
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
        case .update:
            return updateHandleAction()
        case .get:
            return getHandleAction()
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
        case .update:
            output.didFinish?()
        case .set(let data):
            newState.title = data.title
            newState.desc = data.desc
            newState.value = data.value
            newState.imageData = data.imageData
        }
        
        return newState
    }
}

// MARK: - Helper functions

private extension  ItemAModuleViewModel {
    
    func updateHandleAction() -> Observable<Mutation> {
        guard
            currentState.title.count > 0,
            currentState.desc.count > 0
            else { return Observable.empty() }
        
        if let id = id {
            return updateItemAUseCase.execute(request: .init(id: id, title: currentState.title, desc: currentState.desc, value: currentState.value, image: currentState.imageData))
                .map { .update }
        } else {
            return createItemAUseCase.execute(request: .init(title: currentState.title, desc: currentState.desc, value: currentState.value, image: currentState.imageData))
                .map { _ in .update }
        }
    }
    
    func getHandleAction() -> Observable<Mutation> {
        if let id = id {
            return getItemAUseCase.execute(request: .init(id: id))
                .filterNil()
                .map { .set(.init(title: $0.title, desc: $0.desc, value: $0.value, imageData: $0.image)) }
        } else {
            return Observable.just(.set(.init(title: String.random(length: 30), desc: String.random(length: 100), value: Int.random(in: 0...500), imageData: Data(imageName: "Icons/noImage"))))
        }
    }
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
