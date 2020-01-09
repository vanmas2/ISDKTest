//
//  ABListModuleViewController.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit


// MARK: - ABListModuleViewController

final class ABListModuleViewController: ViewController<ABListModuleView> {
    
    // MARK: Private properties
    
    private var viewModel: ABListModuleViewModelProtocol

    // MARK: Constructors
    
    init(viewModel: ABListModuleViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bindViewModel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - Binding ViewModel

private extension ABListModuleViewController {
    
    func bindViewModel() {

        // Actions
        
        view().sortPickerView.rx
            .itemSelected
            .map { $0.row }
            .map { ABListModuleViewModelAction.selectSort($0) }
            .bind(to: viewModel.vmAction)
            .disposed(by: disposeBag)

        // States

        viewModel.vmState
            .map { $0.cells }
            .bind(to: view().tableView.rx.items) { (tableView, index, cellViewModel) in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.reuseIdentifier)!
                (cell as? CellConfigurable)?.configure(withCellViewModel: cellViewModel)
                return cell
            }
            .disposed(by: disposeBag)
        
        viewModel.vmState
            .map { $0.sortTypeItems }
            .distinctUntilChanged()
            .bind(to: view().sortPickerView.rx.itemTitles) { (_, item) in
                return item.title
            }
            .disposed(by: disposeBag)
        
        viewModel.vmState
            .map { $0.sortTypeItemSelected }
            .distinctUntilChanged()
            .bind(onNext: { (item) in
                print("set input", item)
            })
            .disposed(by: disposeBag)
        
        viewModel.vmState
            .map { $0.sortTypeItemSelected.rawValue }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] (itemIndex) in
                self?.view().sortPickerView.selectRow(itemIndex, inComponent: 0, animated: false)
            })
            .disposed(by: disposeBag)
        
        viewModel.vmState
            .map { $0.sortTypeItemSelected }
            .distinctUntilChanged()
            .map { _ in ABListModuleViewModelAction.refresh }
            .observeOn(MainScheduler.asyncInstance)
            .bind(to: viewModel.vmAction)
            .disposed(by: disposeBag)
    }
}

// MARK: Configure

private extension ABListModuleViewController {

    func configure() {
        view().tableView.rx
            .itemSelected
            .bind(to: tableViewItemSelectedBinder)
            .disposed(by: disposeBag)
        
    }
    
    var tableViewItemSelectedBinder: Binder<IndexPath> {
        return Binder<IndexPath>(self) { (target, indexPath) in
            let cell = target.view().tableView.cellForRow(at: indexPath)
            (cell as? CellSelectable)?.select()
        }
    }
}
