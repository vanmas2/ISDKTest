//
//  ABListModuleItemBCell.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//

import UIKit
import Stevia
import RxSwift
import RxCocoa


// MARK: - ABListModuleItemBCell

final class ABListModuleItemBCell: UITableViewCell {
    
    // MARK: Properties
    
    private(set) var view: ABListModuleItemBView!
    
    private var bottomBorder: UIView!
    
    private var viewModel: ABListModuleItemBCellViewModelProtocol?
    
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

private extension ABListModuleItemBCell {
    
    func configureUI() {
        configureViews()
        configureLayout()
        configureStyle()
    }
    
    func configureViews() {
        view = ABListModuleItemBView()
        bottomBorder = UIView()
        sv(view, bottomBorder)
    }
    
    func configureLayout() {
        contentView.fillContainer()
        view.fillContainer()
        
        contentView.layout(
            |bottomBorder|,
            0
        )
        
        bottomBorder.height(1)
    }
    
    func configureStyle() {
        selectionStyle = .none
        style(viewStyle: .init(backgroundColor: .red))
        bottomBorder.style(viewStyle: .init(backgroundColor: .blue))
    }
}

// MARK: - CellReusable

extension ABListModuleItemBCell: CellReusable {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var height: Double {
        return Double(UITableView.automaticDimension)
    }
}

// MARK: - CellConfigurable

extension ABListModuleItemBCell: CellConfigurable {
    
    func configure(withCellViewModel cellViewModel: CellViewModelProtocol) {
        guard
            let viewModel = cellViewModel as? ABListModuleItemBCellViewModelProtocol
            else { return }
        
        self.viewModel = viewModel
        
        disposeBag = DisposeBag()
        
        viewModel.state
            .map { $0.title }
            .bind(to: view.titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.state
            .map { $0.desc }
            .bind(to: view.descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.state
            .map { $0.value }
            .bind(to: view.valueLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.state
            .map { $0.image }
            .bind(to: view.rx.avatar)
            .disposed(by: disposeBag)
        
        viewModel.state
            .map { $0.labels }
            .bind(to: view.labelsLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

// MARK: - CellSelectable

extension ABListModuleItemBCell: CellSelectable {
    
    func select() {
        viewModel.map { $0.action.accept(.select) }
    }
}
