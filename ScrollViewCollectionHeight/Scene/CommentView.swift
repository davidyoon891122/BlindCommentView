//
//  CommentView.swift
//  ScrollViewCollectionHeight
//
//  Created by jiwon Yoon on 2023/01/09.
//

import UIKit

final class CommentView: UIView {
    private let topSortView = TopSortView()
    
    private lazy var accountCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            CommentCollectionViewCell.self,
            forCellWithReuseIdentifier: CommentCollectionViewCell.identifier
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CommentView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        5
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommentCollectionViewCell.identifier, for: indexPath) as? CommentCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setupCell()
        return cell
    }
}

extension CommentView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(
            width: UIScreen.main.bounds.width,
            height: 300.0
        )
    }
}

private extension CommentView {
    func setupViews() {
        [
            topSortView,
            accountCollectionView
        ]
            .forEach {
                addSubview($0)
            }
        
        topSortView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topSortView.topAnchor.constraint(equalTo: topAnchor),
            topSortView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topSortView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            accountCollectionView.topAnchor.constraint(equalTo: topSortView.bottomAnchor),
            accountCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            accountCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            accountCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            accountCollectionView.heightAnchor.constraint(equalToConstant: 1500.0)
        ])
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct CommentViewPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            CommentView()
        }
        .previewLayout(.sizeThatFits)
    }
}
#endif

