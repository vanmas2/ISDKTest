//
//  ABListModuleItemACell.swift
//  ISDKTest
//
//  Created by Иван Масальских on 06/01/2020.
//

import UIKit
import RxSwift
import RxCocoa


// MARK: - ABListModuleItemACell

final class ABListModuleItemACell: UITableViewCell {
    
    // MARK: Properties
    
    private(set) var view: ABListModuleItemAView!
    
    private var viewModel: ABListModuleItemACellViewModelProtocol?
    
    private var disposeBag: DisposeBag = DisposeBag()
    
    // MARK: Constructors
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }
}

// MARK: - Configure UI

private extension ABListModuleItemACell {
    
    func configureUI() {
        configureViews()
        configureLayout()
        configureStyle()
    }
    
    func configureViews() {
        view = ABListModuleItemAView()
        sv(view)
    }
    
    func configureLayout() {
        view.fillContainer()
    }
    
    func configureStyle() {
        selectionStyle = .none
    }
}

// MARK: - CellReusable

extension ABListModuleItemACell: CellReusable {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var height: Double {
        return Double(UITableView.automaticDimension)
    }
}

// MARK: - CellConfigurable

extension ABListModuleItemACell: CellConfigurable {

    func configure(withCellViewModel cellViewModel: CellViewModelProtocol) {
        guard
            let viewModel = cellViewModel as? ABListModuleItemACellViewModelProtocol
            else { return }
        
        self.viewModel = viewModel
        
        disposeBag = DisposeBag()
        
        viewModel.state
            .map { $0.title }
            .bind(to: view.titleLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

// MARK: - CellSelectable

extension ABListModuleItemACell: CellSelectable {
    
    func select() {
        viewModel.map { $0.action.accept(.select) }
    }
}
