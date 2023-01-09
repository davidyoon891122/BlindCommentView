//
//  CommentViewController.swift
//  ScrollViewCollectionHeight
//
//  Created by jiwon Yoon on 2023/01/09.
//

import UIKit

final class CommentViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        
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
        return 3
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 5
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        UICollectionViewCell()
    }
    
    
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

