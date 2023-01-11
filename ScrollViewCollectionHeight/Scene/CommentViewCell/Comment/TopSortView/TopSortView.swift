//
//  TopSortView.swift
//  ScrollViewCollectionHeight
//
//  Created by jiwon Yoon on 2023/01/09.
//

import UIKit

final class TopSortView: UIView {
    private let leftSortView = LeftSortView()

    private let rightSortView = RightSortView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TopSortView {
    func setupViews() {
        [
            leftSortView,
            rightSortView
        ]
            .forEach {
                addSubview($0)
            }
        
        leftSortView.translatesAutoresizingMaskIntoConstraints = false
        rightSortView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftSortView.topAnchor.constraint(equalTo: topAnchor),
            leftSortView.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftSortView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            rightSortView.centerYAnchor.constraint(equalTo: leftSortView.centerYAnchor),
            rightSortView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct TopSortViewPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            TopSortView()
        }
        .frame(width: UIScreen.main.bounds.width, height: 50.0)
        .previewLayout(.sizeThatFits)
    }
}


#endif
