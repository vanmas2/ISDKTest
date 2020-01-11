//
//  ABListModuleItemAView.swift
//  ISDKTest
//
//  Created by Иван Масальских on 06/01/2020.
//

import UIKit
import Stevia
import RxSwift
import RxCocoa


// MARK: - ABListModuleItemAView

final class ABListModuleItemAView: UIView {
    
    // MARK: Properties
    
    private(set) var avatarImageView: UIImageView!
    
    private(set) var titleLabel: UILabel!
    
    private(set) var descriptionLabel: UILabel!
    
    private(set) var valueLabel: UILabel!
    
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
}

// MARK: - Configure UI

private extension ABListModuleItemAView {
    
    func configureUI() {
        configureViews()
        configureLayout()
        configureStyle()
    }
    
    func configureViews() {
        avatarImageView = UIImageView()
        titleLabel = UILabel()
        descriptionLabel = UILabel()
        valueLabel = UILabel()
        dataWrapperView = UIView()
        textWrapperView = UIView()
        
        sv(
            avatarImageView,
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
            |-20-avatarImageView,
            (>=10)
        )
        layout(
            10,
            dataWrapperView-20-|,
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
        style(viewStyle: .init(backgroundColor: .white))
        titleLabel.style(labelStyle: .init(font: UIFont.boldSystemFont(ofSize: 18), numberOfLines: 0))
        descriptionLabel.style(labelStyle: .init(font: UIFont.systemFont(ofSize: 16), numberOfLines: 0))
        valueLabel.style(labelStyle: .init(font: UIFont.systemFont(ofSize: 16), lineBreakMode: .byTruncatingTail))
        
        avatarImageView.layer.cornerRadius = 5
        avatarImageView.clipsToBounds = true
    }
}

extension Reactive where Base: ABListModuleItemAView {
    
    var avatar: Binder<String> {
        return Binder(self.base.avatarImageView) { avatarImageView, path in
            avatarImageView.image = UIImage(named: path)
        }
    }
}


