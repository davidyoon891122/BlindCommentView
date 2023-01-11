//
//  ImageAndLabelView.swift
//  ScrollViewCollectionHeight
//
//  Created by jiwon Yoon on 2023/01/09.
//

import UIKit

final class ImageAndLabelView: UIView {
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "")
        imageView.tintColor = .label
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        
        [
            iconImageView,
            titleLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: view.topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 16.0),
            iconImageView.widthAnchor.constraint(equalToConstant: 16.0)
            
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: offset / 2),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -offset)
        ])
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    init(imageName: String, title: String) {
        super.init(frame: .zero)
        self.iconImageView.image = UIImage(systemName: imageName)
        self.titleLabel.text = title
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ImageAndLabelView {
    func setupViews() {
        addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ImageAndLabel_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            ImageAndLabelView(imageName: "heart", title: "Likes")
        }
        .frame(width: UIScreen.main.bounds.width, height: 50.0)
        .previewLayout(.sizeThatFits)
    }
}
#endif

