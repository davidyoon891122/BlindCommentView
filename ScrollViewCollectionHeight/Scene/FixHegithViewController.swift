//
//  FixHegithViewController.swift
//  ScrollViewCollectionHeight
//
//  Created by jiwon Yoon on 2023/01/09.
//

import UIKit

final class FixHegithViewController: UIViewController {
    private let commentView = CommentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

private extension FixHegithViewController {
    func setupViews() {
        [
            commentView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        commentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            commentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            commentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            commentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            commentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct FixHegithViewController_Previews: PreviewProvider {
    static var previews: some View {
        FixHegithViewController().showPreview(.iPhone13ProMax)
    }
}


#endif

