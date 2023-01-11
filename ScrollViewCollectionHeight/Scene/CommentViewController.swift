//
//  CommentViewController.swift
//  ScrollViewCollectionHeight
//
//  Created by jiwon Yoon on 2023/01/09.
//

import UIKit

final class CommentViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = DynamicFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(
            ContentCell.self,
            forCellWithReuseIdentifier: ContentCell.identifier
        )
        
        collectionView.register(
            AdvertiseCell.self,
            forCellWithReuseIdentifier: AdvertiseCell.identifier
        )
        
        collectionView.register(
            SortMenuCell.self,
            forCellWithReuseIdentifier: SortMenuCell.identifier
        )

        collectionView.register(
            CommentCell.self,
            forCellWithReuseIdentifier: CommentCell.identifier
        )
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension CommentViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return 1
        }
        else if section == 2 {
            return 1
        }
        else if section == 3 {
            return 10
        }
        return 1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ContentCell.identifier,
                for: indexPath
            ) as? ContentCell else { return UICollectionViewCell() }
            return cell
        }
        else if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AdvertiseCell.identifier,
                for: indexPath
            ) as? AdvertiseCell else { return UICollectionViewCell() }
            return cell
        }
        else if indexPath.section == 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SortMenuCell.identifier, for: indexPath) as? SortMenuCell else { return UICollectionViewCell() }
            cell.setupCell()
            return cell
        }
        else if indexPath.section == 3 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommentCell.identifier, for: indexPath) as? CommentCell else { return UICollectionViewCell() }

            return cell
        }
        
        return UICollectionViewCell()
    }
}


extension CommentViewController: UICollectionViewDelegateFlowLayout {
    
}

private extension CommentViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        [
            collectionView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        
    }
    
    func configureNavigation() {
        navigationItem.title = "Comment"
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct CommentViewController_Preview: PreviewProvider {
    static var previews: some View {
        UINavigationController(rootViewController: CommentViewController()).showPreview(.iPhone13ProMax)
    }
}
#endif

