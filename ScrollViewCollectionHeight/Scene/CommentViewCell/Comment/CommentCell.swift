//
//  CommentCell.swift
//  ScrollViewCollectionHeight
//
//  Created by jiwon Yoon on 2023/01/09.
//

import UIKit

final class CommentCell: UICollectionViewCell {
    static let identifier = "CommentCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Comment Title"
        label.textColor = .label
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .gray
        textView.text =
        """
        Swift Ref, the global payment reference data utility, is SWIFT's unique reference data service. Swift Ref sources data direct from data originators, including central banks, code issuers and banks making it easy for issuers and originators to maintain data regularly and thoroughly. SWIFTRef constantly validates and cross-checks data across the different data sets.
        """
        
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(
        _ layoutAttributes: UICollectionViewLayoutAttributes
    ) -> UICollectionViewLayoutAttributes {
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
        layoutAttributes.frame.size = contentView.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        
        return layoutAttributes
    }
}


private extension CommentCell {
    func setupViews() {
        [
            titleLabel,
            contentTextView
        ]
            .forEach {
                contentView.addSubview($0)
            }
        let offset: CGFloat = 16.0
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: offset),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: offset)
        ])
        
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        NSLayoutConstraint.activate([
            contentTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: offset),
            contentTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: offset),
            contentTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -offset),
            contentTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -offset)
        ])
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct CommentCell_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            CommentCell()
        }
        .frame(width: UIScreen.main.bounds.width, height: 500.0)
        .previewLayout(.sizeThatFits)
    }
}

#endif
