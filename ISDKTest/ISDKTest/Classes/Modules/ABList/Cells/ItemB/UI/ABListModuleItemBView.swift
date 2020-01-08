//
//  ABListModuleItemBView.swift
//  ISDKTest
//
//  Created by Иван Масальских on 08/01/2020.
//


import UIKit
import Stevia
import RxSwift
import RxCocoa


// MARK: - ABListModuleItemBView

final class ABListModuleItemBView: UIView {
    
    // MARK: Properties
    
    private(set) var avatarImageView: UIImageView!
    
    private(set) var titleLabel: UILabel!
    
    private(set) var descriptionLabel: UILabel!
    
    private(set) var valueLabel: UILabel!
    
    private(set) var labelsLabel: UILabel!
    
    private var dataWrapperView: UIView!
    
    private var textWrapperView: UIView!
    
    // MARK: Constructors
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }
    
//    override func layoutSubviews() {
//        labelsLabel.sizeToFit()
//    }
}

// MARK: - Configure UI

private extension ABListModuleItemBView {
    
    func configureUI() {
        configureViews()
        configureLayout()
        configureStyle()
    }
    
    func configureViews() {
        avatarImageView = UIImageView()
        labelsLabel = UILabel()
        titleLabel = UILabel()
        descriptionLabel = UILabel()
        valueLabel = UILabel()
        dataWrapperView = UIView()
        textWrapperView = UIView()
        
        sv(
            avatarImageView,
            labelsLabel,
            dataWrapperView.sv(
                textWrapperView.sv(
                    titleLabel,
                    descriptionLabel
                ),
                valueLabel
            )
        )
    }
    
    func configureLayout() {
        layout(
            10,
            |-10-avatarImageView,
            (>=10)
        )
        
        labelsLabel.Top == avatarImageView.Top
        labelsLabel.Left == avatarImageView.Left
        labelsLabel.Right == avatarImageView.Right
        labelsLabel.Height <= Height - 20
        
        labelsLabel.setContentCompressionResistancePriority(.init(1), for: .vertical)
        labelsLabel.setContentHuggingPriority(.init(999), for: .vertical)
        
        layout(
            10,
            dataWrapperView-10-|,
            (>=10)
        )
        
        avatarImageView-10-dataWrapperView
        
        dataWrapperView.layout(
            0,
            |-0-textWrapperView,
            0
        )
        dataWrapperView.layout(
            0,
            valueLabel-0-|,
            (>=0)
        )
        textWrapperView-10-valueLabel
        valueLabel.Width <= textWrapperView.Width
        
        textWrapperView.layout(
            0,
            |titleLabel|,
            10,
            |descriptionLabel|,
            0
        )
        
        textWrapperView.setContentHuggingPriority(.init(250), for: .horizontal)
        titleLabel.setContentHuggingPriority(.init(250), for: .horizontal)
        descriptionLabel.setContentHuggingPriority(.init(250), for: .horizontal)
        valueLabel.setContentHuggingPriority(.init(750), for: .horizontal)
        
        textWrapperView.setContentCompressionResistancePriority(.init(250), for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(.init(250), for: .horizontal)
        descriptionLabel.setContentCompressionResistancePriority(.init(250), for: .horizontal)
        valueLabel.setContentCompressionResistancePriority(.init(750), for: .horizontal)
        
        avatarImageView.size(75.0)
    }
    
    func configureStyle() {
        style(viewStyle: .init(backgroundColor: .red))
        titleLabel.style(labelStyle: .init(font: UIFont.boldSystemFont(ofSize: 18), numberOfLines: 0))
        descriptionLabel.style(labelStyle: .init(font: UIFont.systemFont(ofSize: 16), numberOfLines: 0))
        valueLabel.style(labelStyle: .init(font: UIFont.systemFont(ofSize: 16), lineBreakMode: .byTruncatingTail))
        labelsLabel.style(labelStyle: .init(font: UIFont.systemFont(ofSize: 14), numberOfLines: 0, textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), adjustsFontSizeToFitWidth: true, minimumScaleFactor: 0.5))
    }
}

extension Reactive where Base: ABListModuleItemBView {
    
    var avatar: Binder<String> {
        return Binder(self.base.avatarImageView) { avatarImageView, path in
            avatarImageView.image = UIImage(named: path)
        }
    }
}



