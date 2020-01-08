//
//  ABListModuleViewModel.swift
//  ISDKTest
//
//  Created by Иван Масальских on 05/01/2020.
//

import Foundation
import RxRelay
import RxSwift
import RxCocoa


// MARK: - ABListModuleViewModel

final class ABListModuleViewModel {
    
    // MARK: Private properties
    
    private var _state: BehaviorRelay<ABListModuleViewModelState>
    
    private var _action: PublishRelay<ABListModuleViewModelAction>
    
    private var getABListUseCase: GetABListUseCaseProtocol
    
    private var output: Output
    
    private var disposeBag = DisposeBag()
    
    // MARK: Constructors
    
    init(getABListUseCase: GetABListUseCaseProtocol) {
        self.getABListUseCase = getABListUseCase
        
        output = Output()
        _state = .init(value: .init(cells: []))
        _action = .init()
        
        _action.filter { $0 == .refresh }
            .flatMap { _ in self.getABListUseCase.execute(request: .init(sort: .bType)) }
            .map { (items) in
                return items.items.map { (item) -> CellViewModelProtocol in
                    switch item {
                    case .itemA(let item):
                        return ABListModuleItemACellViewModel(title: item.title, desc: item.desc, value: item.value.description, image: item.image)
                    case .itemB(let item):
                        return ABListModuleItemBCellViewModel(title: item.title, desc: item.desc, value: item.value.description, image: item.image, labels: item.labels.reduce("") { "\($0)\($1) " })
                    }
                }
            }
            .map { ABListModuleViewModelState(cells: $0) }
            .bind { self._state.accept($0) }
            .disposed(by: disposeBag)
        
//        _action.bind(to: actionBinder).disposed(by: disposeBag)
    }
}

// MARK: - Helper functions

private extension ABListModuleViewModel {
    
    func reduce(state: ABListModuleViewModelState, action: ABListModuleViewModelAction) -> ABListModuleViewModelState {
        switch action {
        case .createA: return createAHandleAction(state: state)
        case .selectA: return selectAHandleAction(state: state)
        case .createB: return createBHandleAction(state: state)
        case .selectB: return selectBHandleAction(state: state)
        case .refresh: return refreshHandleAction(state: state)
        }
    }
    
    func createAHandleAction(state: ABListModuleViewModelState) -> ABListModuleViewModelState {
        return state
    }
    
    func selectAHandleAction(state: ABListModuleViewModelState) -> ABListModuleViewModelState {
        return state
    }
    
    func createBHandleAction(state: ABListModuleViewModelState) -> ABListModuleViewModelState {
        return state
    }
    
    func selectBHandleAction(state: ABListModuleViewModelState) -> ABListModuleViewModelState {
        return state
    }
    
    func refreshHandleAction(state: ABListModuleViewModelState) -> ABListModuleViewModelState {
        getABListUseCase.execute(request: .init(sort: .title))
            .bind { (response) in
                
            }
        return state
    }
}

// MARK: - ABListModuleViewModelProtocol

extension ABListModuleViewModel: ABListModuleViewModelProtocol {
    
    var state: BehaviorRelay<ABListModuleViewModelState> {
        get { return _state }
        set { _state = newValue }
    }
    
    var action: PublishRelay<ABListModuleViewModelAction> {
        get { return _action }
        set { _action = newValue }
    }
}

// MARK: - ABListModuleIntput

extension ABListModuleViewModel: ABListModuleIntput {}

// MARK: - ABListModuleOutput

extension ABListModuleViewModel: ABListModuleOutput {
    
    var didFinish: (() -> Void)? {
        get { return output.didFinish }
        set { output.didFinish = newValue }
    }
    
    var showAddA: (() -> Void)? {
        get { return output.showAddA }
        set { output.showAddA = newValue }
    }
    
    var showAddB: (() -> Void)? {
        get { return output.showAddB }
        set { output.showAddB = newValue }
    }
}

// MARK: - Binders

private extension ABListModuleViewModel {
    
    var actionBinder: Binder<ABListModuleViewModelAction> {
        return Binder<ABListModuleViewModelAction>(self) { (target, action) in
            target._state.accept(target.reduce(state: target._state.value, action: action))
        }
    }
}

// MARK: - Helper types

private extension ABListModuleViewModel {
    
    struct Output {
        var didFinish: (() -> Void)?
        var showAddA: (() -> Void)?
        var showAddB: (() -> Void)?
    }
}

// MARK: - Stub

private extension ABListModuleViewModel {
    
    enum Stub {
        static let viewModels: [CellViewModelProtocol] = [
            ABListModuleItemACellViewModel(title: "A One One One One One One One", desc: "One desc One desc One desc One desc One desc One desc", value: "123456789", image: "Icons/noImage"),
            ABListModuleItemACellViewModel(title: "A Two Two Two Two v Two Two Two Two Two v Two Two Two Two v v Two", desc: "Two desc Two desc Two desc Two desc Two desc Two desc Two desc Two desc v Two desc Two desc", value: "123456789101112131415", image: "Icons/noImage"),
            ABListModuleItemACellViewModel(title: "A Three Three", desc: "Three desc", value: "123", image: "Icons/noImage"),
            ABListModuleItemBCellViewModel(title: "B One One One One One One One", desc: "One desc One desc One desc One desc One desc One desc", value: "123456789", image: "Icons/noImage", labels: "labels labels labels labels labels labels"),
            ABListModuleItemBCellViewModel(title: "B Two Two Two Two v Two Two Two Two Two v Two Two Two Two v v Two", desc: "Two desc Two desc Two desc Two desc Two desc Two desc Two desc Two desc v Two desc Two desc", value: "123456789101112131415", image: "Icons/noImage", labels: "labels"),
            ABListModuleItemBCellViewModel(title: "B Three Three", desc: "Three desc", value: "123", image: "Icons/noImage", labels: "labels labels labels labels labels labels labels labels labels"),
            ABListModuleItemBCellViewModel(title: "B Four Four", desc: "Four desc", value: "123", image: "Icons/noImage", labels: "labels labels labels labels labels")
        ]
    }
}
