//
//  ContentCell.swift
//  ScrollViewCollectionHeight
//
//  Created by jiwon Yoon on 2023/01/09.
//

import UIKit

final class ContentCell: UICollectionViewCell {
    private let creatorView = ContentCreatorView()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textColor = .label
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var contentTextView: UITextView = {
        let textView = UITextView()
        textView.text =
        """
        The Society for Worldwide Interbank Financial Telecommunication (SWIFT), legally S.W.I.F.T. SC, is a Belgian cooperative society providing services related to the execution of financial transactions and payments between banks worldwide. Its principal function is to serve as the main messaging network through which international payments are initiated.[2] It also sells software and services to financial institutions, mostly for use on its proprietary "SWIFTNet", and assigns ISO 9362 Business Identifier Codes (BICs), popularly known as "SWIFT codes".

        The SWIFT messaging network is a component of the global payments system.[3] SWIFT acts as a carrier of the "messages containing the payment instructions between financial institutions involved in a transaction".[4][5] However, the organization does not manage accounts on behalf of individuals or financial institutions, and it does not hold funds from third parties.[6] It also does not perform clearing or settlement functions.[7][5] After a payment has been initiated, it must be settled through a payment system, such as TARGET2 in Europe.[8] In the context of cross-border transactions, this step often takes place through correspondent banking accounts that financial institutions have with each other.[4]

        """
        
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    private let iconAndLabelStackView = IconAndLabelStackView()
    
    private lazy var separatorView = SeparatorView(size: 1.0, color: .gray.withAlphaComponent(0.3), type: .horizontal)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ContentCell {
    func setupViews() {
        [
            creatorView,
            titleLabel,
            contentTextView,
            iconAndLabelStackView,
            separatorView
        ]
            .forEach {
                addSubview($0)
            }
        
        creatorView.translatesAutoresizingMaskIntoConstraints = false
        iconAndLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        let offset: CGFloat = 16.0
        NSLayoutConstraint.activate([
            creatorView.topAnchor.constraint(equalTo: topAnchor),
            creatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            creatorView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: creatorView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: offset),
            contentTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            contentTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
        ])
        
        NSLayoutConstraint.activate([
            iconAndLabelStackView.topAnchor.constraint(equalTo: contentTextView.bottomAnchor, constant: offset),
            iconAndLabelStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconAndLabelStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: iconAndLabelStackView.bottomAnchor, constant: offset),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ContentCellPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            ContentCell()
        }
        .previewLayout(.sizeThatFits)
    }
}
#endif

