//
//  ContentCreatorView.swift
//  ScrollViewCollectionHeight
//
//  Created by jiwon Yoon on 2023/01/09.
//

import UIKit

final class ContentCreatorView: UIView {
    private lazy var creatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.layer.cornerRadius = 10.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var creatorLabel: UILabel = {
        let label = UILabel()
        label.text = "Creator"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "09, Jan, 2023"
        label.textColor = .gray
        
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

private extension ContentCreatorView {
    func setupViews() {
        [
            creatorImageView,
            creatorLabel,
            dateLabel
        ]
            .forEach {
                addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        NSLayoutConstraint.activate([
            creatorImageView.topAnchor.constraint(equalTo: topAnchor, constant: offset),
            creatorImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            creatorImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset),
            creatorImageView.widthAnchor.constraint(equalToConstant: 20.0),
            creatorImageView.heightAnchor.constraint(equalToConstant: 20.0)
        ])
        
        NSLayoutConstraint.activate([
            creatorLabel.centerYAnchor.constraint(equalTo: creatorImageView.centerYAnchor),
            creatorLabel.leadingAnchor.constraint(equalTo: creatorImageView.trailingAnchor, constant: offset),
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.centerYAnchor.constraint(equalTo: creatorImageView.centerYAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset)
        ])
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ContentCreatorView_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            ContentCreatorView()
        }
        .frame(width: UIScreen.main.bounds.width, height: 50.0)
        .previewLayout(.sizeThatFits)
    }
}
#endif

