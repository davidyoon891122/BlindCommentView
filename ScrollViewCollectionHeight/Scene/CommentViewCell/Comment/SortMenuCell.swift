//
//  SortMenuCell.swift
//  ScrollViewCollectionHeight
//
//  Created by jiwon Yoon on 2023/01/10.
//

import UIKit

final class SortMenuCell: UICollectionViewCell {
    static let identifier = "SortMenuCell"
    
    private let topSortView = TopSortView()
    
    func setupCell() {
        setupViews()
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

private extension SortMenuCell {
    func setupViews() {
        [
            topSortView
        ]
            .forEach {
                contentView.addSubview($0)
            }
        topSortView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topSortView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topSortView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            topSortView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            topSortView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}


