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
    
    private let id: String?
    
    private let updateItemBUseCase: UpdateItemBUseCaseProtocol
    
    private let getItemBUseCase: GetItemBUseCaseProtocol
    
    private let createItemBUseCase: CreateItemBUseCaseProtocol
    
    private var output: Output
    
    private var disposeBag = DisposeBag()
    
    // MARK: Constructors
    
    init(id: String?, getItemBUseCase: GetItemBUseCaseProtocol, updateItemBUseCase: UpdateItemBUseCaseProtocol, createItemBUseCase: CreateItemBUseCaseProtocol) {
        self.getItemBUseCase = getItemBUseCase
        self.updateItemBUseCase = updateItemBUseCase
        self.createItemBUseCase = createItemBUseCase
        self.id = id
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
        return ItemBModuleViewModelState(title: "", desc: "", value: 0, imageData: Data(), labels: "")
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
        case .update:
            guard
                currentState.title.count > 0,
                currentState.desc.count > 0,
                currentState.title.count <= 50,
                currentState.desc.count <= 300
                else { return Observable.empty() }
            if let id = id {
                return updateItemBUseCase.execute(request: .init(id: id, title: currentState.title, desc: currentState.desc, value: currentState.value, image: currentState.imageData, labels: currentState.labels.components(separatedBy: " ")))
                    .map { .update }
            } else {
                return createItemBUseCase.execute(request: .init(title: currentState.title, desc: currentState.desc, value: currentState.value, image: currentState.imageData, labels: currentState.labels.components(separatedBy: " ")))
                    .map { _ in .update }
            }
        case .get:
            if let id = id {
                return getItemBUseCase.execute(request: .init(id: id))
                    .filterNil()
                    .map {
                        var labels = $0.labels.reduce("") { "\($0) \($1)" }
                        labels.removeFirst()
                        return .set(.init(title: $0.title, desc: $0.desc, value: $0.value, imageData: $0.image, labels: labels))
                }
            } else {
                return Observable.just(.set(.init(title: String.random(length: 20), desc: String.random(length: 100), value: Int.random(in: 0...500), imageData: Data(imageName: "Icons/noImage"), labels: "")))
            }
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
        case .update:
            output.didFinish?()
        case .set(let data):
            newState.title = data.title
            newState.desc = data.desc
            newState.value = data.value
            newState.imageData = data.imageData
            newState.labels = data.labels
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
