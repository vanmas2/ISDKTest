//
//  ABListModuleViewController.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import UIKit
import RxSwift
import RxCocoa


// MARK: - ABListModuleViewController

final class ABListModuleViewController: ViewController<ABListModuleView> {
    
    // MARK: Private properties
    
    private var viewModel: ABListModuleViewModelProtocol
    
    private let disposeBag = DisposeBag()
    
    // MARK: Constructors
    
    init(viewModel: ABListModuleViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bindViewModel()
    }
}

// MARK: - Binding ViewModel

private extension ABListModuleViewController {
    
    func bindViewModel() {
        viewModel.state
            .map { $0.cells }
            .bind(to: view().tableView.rx.items) { (tableView, index, cellViewModel) in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.reuseIdentifier)!
                (cell as? CellConfigurable)?.configure(withCellViewModel: cellViewModel)
                return cell
            }
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