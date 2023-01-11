//
//  RightSortView.swift
//  ScrollViewCollectionHeight
//
//  Created by jiwon Yoon on 2023/01/09.
//

import UIKit

final class RightSortView: UIView {
    private lazy var downIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.down")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Recent view"
        label.textColor = .label
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension RightSortView {
    func setupViews() {
        [
            downIconImageView,
            titleLabel
        ]
            .forEach {
                addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        
        NSLayoutConstraint.activate([
            downIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: offset),
            downIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            downIconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset),
            downIconImageView.widthAnchor.constraint(equalToConstant: 12.0),
            downIconImageView.heightAnchor.constraint(equalToConstant: 12.0)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: downIconImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: downIconImageView.trailingAnchor, constant: offset),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset)
        ])
        
        
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct RightSortViewPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            RightSortView()
        }
        .frame(width: UIScreen.main.bounds.width, height: 50.0)
        .previewLayout(.sizeThatFits)
    }
}
#endif
