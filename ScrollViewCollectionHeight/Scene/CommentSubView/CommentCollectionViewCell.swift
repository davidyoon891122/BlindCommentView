//
//  CommentCollectionViewCell.swift
//  ScrollViewCollectionHeight
//
//  Created by jiwon Yoon on 2023/01/09.
//

import UIKit

final class CommentCollectionViewCell: UICollectionViewCell {
    static let identifier = "CommentCollectionViewCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var contentTextView: UITextView = {
        let textView = UITextView()
        textView.text =
        """
        SwiftUI provides views, controls, and layout structures for declaring your app’s user interface. The framework provides event handlers for delivering taps, gestures, and other types of input to your app, and tools to manage the flow of data from your app’s models down to the views and controls that users see and interact with.
        Define your app structure using the App protocol, and populate it with scenes that contain the views that make up your app’s user interface. Create your own custom views that conform to the View protocol, and compose them with SwiftUI views for displaying text, images, and custom shapes using stacks, lists, and more. Apply powerful modifiers to built-in views and your own views to customize their rendering and interactivity. Share code between apps on multiple platforms with views and controls that adapt to their context and presentation.
        """
        textView.textColor = .label
        
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        setupViews()
    }
}

private extension CommentCollectionViewCell {
    func setupViews() {
        [
            titleLabel,
            contentTextView
        ]
            .forEach {
                addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: offset),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset)
        ])
        
        NSLayoutConstraint.activate([
            contentTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: offset),
            contentTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            contentTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
            contentTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset)
        ])
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct CommentCollectionViewCellPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            CommentCollectionViewCell()
        }
        .previewLayout(.sizeThatFits)
    }
}
#endif

