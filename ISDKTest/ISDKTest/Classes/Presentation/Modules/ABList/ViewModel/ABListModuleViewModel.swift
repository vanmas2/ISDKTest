//
//  ABListModuleViewModel.swift
//  ISDKTest
//
//  Created by Иван Масальских on 05/01/2020.
//

import Foundation
import RxSwift
import RxCocoa
import ReactorKit


// MARK: - ABListModuleViewModel

final class ABListModuleViewModel {
    
    // MARK: Private properties

    private var getABListUseCase: GetABListUseCaseProtocol
    
    private var output: Output
    
    private var disposeBag = DisposeBag()
    
    // MARK: Constructors
    
    init(getABListUseCase: GetABListUseCaseProtocol) {
        self.getABListUseCase = getABListUseCase
        output = Output()
    }
}

// MARK: - Reactor

extension ABListModuleViewModel: Reactor {

    // MARK: Typealias

    typealias Action = ABListModuleViewModelAction

    typealias Mutation = ABListModuleViewModelMutation

    typealias State = ABListModuleViewModelState

    // MARK: Properties

    var initialState: ABListModuleViewModelState {
        return ABListModuleViewModelState(
            cells: [],
            sortTypeItems: SortTypeItem.allCases,
            sortTypeItemSelected: .value)
    }

    // MARK: Functions

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .createA:
            output.showAddItemA?()
            return Observable.empty()
        case .selectA(let id):
            output.showItemA?(id)
            return Observable.empty()
        case .createB:
            output.showAddItemB?()
            return Observable.empty()
        case .selectB(let id):
            output.showItemB?(id)
            return Observable.empty()
        case .refresh:
            return refreshHandleAction()
        case .selectSort(let index):
            return selectSortHandleAction(index: index)
        }
    }

    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state

        switch mutation {
        case .setItems(let items):
            newState.cells = items
        case .setSortType(let sortTypeItem):
            newState.sortTypeItemSelected = sortTypeItem
        }

        return newState
    }
}

// MARK: - Helper functions

private extension ABListModuleViewModel {

    func refreshHandleAction() -> Observable<Mutation> {
        return getABListUseCase.execute(request: .init(sort: sortTypeItemRequest()))
            .map { (items) in
                return items.items.map { (item) -> CellViewModelProtocol in
                    switch item {
                    case .itemA(let item):
                        let viewModel = ABListModuleItemACellViewModel(id: item.id, title: item.title, desc: item.desc, value: item.value.description, image: item.image, viewModel: self)
                        return viewModel
                    case .itemB(let item):
                        return ABListModuleItemBCellViewModel(id: item.id, title: item.title, desc: item.desc, value: item.value.description, image: item.image, labels: item.labels.reduce("") { "\($0)\($1) " }, viewModel: self)
                    }
                }
            }
            .map { .setItems($0) }
    }
    
    func selectSortHandleAction(index: Int) -> Observable<Mutation> {
        return Observable.from(currentState.sortTypeItems)
            .filter { $0.rawValue == index }
            .map { .setSortType($0) }
    }
    
    func sortTypeItemRequest() -> GetABListUseCaseModels.Request.Sort {
        switch currentState.sortTypeItemSelected {
        case .title: return .title
        case .value: return .value
        case .aItems: return .aType
        case .bItems: return .bType
        }
    }
}

// MARK: - ABListModuleViewModelProtocol

extension ABListModuleViewModel: ABListModuleViewModelProtocol {
    
    var vmAction: ActionSubject<ABListModuleViewModelAction> {
        return action
    }

    var vmState: Observable<ABListModuleViewModelState> {
        return state
    }
}

// MARK: - ABListModuleIntput

extension ABListModuleViewModel: ABListModuleIntput {
    
    func refresh() {
        Observable.just(())
            .map { ABListModuleViewModelAction.refresh }
            .bind(to: self.vmAction)
            .disposed(by: disposeBag)
    }
}

// MARK: - ABListModuleOutput

extension ABListModuleViewModel: ABListModuleOutput {
    
    var didFinish: (() -> Void)? {
        get { return output.didFinish }
        set { output.didFinish = newValue }
    }
    
    var showAddItemA: (() -> Void)? {
        get { return output.showAddItemA }
        set { output.showAddItemA = newValue }
    }
    
    var showAddItemB: (() -> Void)? {
        get { return output.showAddItemB }
        set { output.showAddItemB = newValue }
    }
    
    var showItemA: ((String) -> Void)? {
        get { return output.showItemA }
        set { output.showItemA = newValue }
    }
    
    var showItemB: ((String) -> Void)? {
        get { return output.showItemB }
        set { output.showItemB = newValue }
    }
}

// MARK: - Helper types

private extension ABListModuleViewModel {
    
    struct Output {
        var didFinish: (() -> Void)?
        var showAddItemA: (() -> Void)?
        var showAddItemB: (() -> Void)?
        var showItemA: ((String) -> Void)?
        var showItemB: ((String) -> Void)?
    }
}
