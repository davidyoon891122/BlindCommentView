//
//  BannerCell.swift
//  ScrollViewCollectionHeight
//
//  Created by jiwon Yoon on 2023/01/10.
//

import UIKit

final class BannerCell: UICollectionViewCell {
    static let identifier = "BannerCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "admob"
        label.textColor = .label
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        [
            bannerImageView
        ]
            .forEach {
                view.addSubview($0)
            }
    
        
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: view.bottomAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bannerImageView.heightAnchor.constraint(equalToConstant: 80.0)
        ])
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
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

private extension BannerCell {
    func setupViews() {
        contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct BannerCell_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            BannerCell()
        }
        .frame(width: UIScreen.main.bounds.width, height: 80.0)
        .previewLayout(.sizeThatFits)
    }
}
#endif
