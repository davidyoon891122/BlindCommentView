//
//  LeftSortView.swift
//  ScrollViewCollectionHeight
//
//  Created by jiwon Yoon on 2023/01/09.
//

import UIKit

final class LeftSortView: UIView {
    private lazy var sliderIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "slider.horizontal.3")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Default"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var downIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrowtriangle.down")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension LeftSortView {
    func setupViews() {
        [
            sliderIconImageView,
            titleLabel,
            downIconImageView
        ]
            .forEach {
                addSubview($0)
            }
        
        
        let offset: CGFloat = 16.0
        
        NSLayoutConstraint.activate([
            sliderIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: offset),
            sliderIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            sliderIconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset),
            sliderIconImageView.widthAnchor.constraint(equalToConstant: 16.0),
            sliderIconImageView.heightAnchor.constraint(equalToConstant: 16.0)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: sliderIconImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: sliderIconImageView.trailingAnchor, constant: offset)
        ])
        
        NSLayoutConstraint.activate([
            downIconImageView.centerYAnchor.constraint(equalTo: sliderIconImageView.centerYAnchor),
            downIconImageView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: offset),
            downIconImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
            downIconImageView.widthAnchor.constraint(equalToConstant: 12.0),
            downIconImageView.heightAnchor.constraint(equalToConstant: 12.0)
        ])
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct LeftSortViewPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let leftSortView = LeftSortView()
            return leftSortView
        }
        .frame(width: UIScreen.main.bounds.width, height: 50.0)
        .previewLayout(.sizeThatFits)
    }
}
#endif
