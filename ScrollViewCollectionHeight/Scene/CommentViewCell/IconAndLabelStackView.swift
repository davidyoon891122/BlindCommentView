//
//  IconAndLabelStackView.swift
//  ScrollViewCollectionHeight
//
//  Created by jiwon Yoon on 2023/01/09.
//

import UIKit

final class IconAndLabelStackView: UIView {
    private lazy var likeView = ImageAndLabelView(imageName: "heart", title: "Likes")
    private lazy var commentView = ImageAndLabelView(imageName: "message", title: "Comments")
    private lazy var watchViews = ImageAndLabelView(imageName: "eye", title: "Views")
    
    private lazy var iconStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        
        [
            likeView,
            commentView,
            watchViews
        ]
            .forEach {
                stackView.addArrangedSubview($0)
            }
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension IconAndLabelStackView {
    func setupViews() {
        [
            iconStackView
        ]
            .forEach {
                addSubview($0)
            }
        
        
        let offset: CGFloat = 16.0
        NSLayoutConstraint.activate([
            iconStackView.topAnchor.constraint(equalTo: topAnchor, constant: offset),
            iconStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset),
            iconStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct IconAndLabelStackView_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            IconAndLabelStackView()
        }
        .frame(width: UIScreen.main.bounds.width, height: 50.0)
        .previewLayout(.sizeThatFits)
    }
}

#endif
