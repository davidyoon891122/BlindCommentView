//
//  SeparatorView.swift
//  ScrollViewCollectionHeight
//
//  Created by jiwon Yoon on 2023/01/09.
//

import UIKit

enum SeparatorTypeEnum {
    case vertical
    case horizontal
}

final class SeparatorView: UIView {
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var height: CGFloat
    private var type: SeparatorTypeEnum
    
    init(size: CGFloat = 1.0, color: UIColor = .gray, type: SeparatorTypeEnum = .vertical) {
        self.height = size
        self.type = type
        super.init(frame: .zero)
        self.separatorView.backgroundColor = color
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SeparatorView {
    func setupViews() {
        [
            separatorView
        ]
            .forEach {
                addSubview($0)
            }
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: topAnchor),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        switch type {
        case .vertical:
            separatorView.widthAnchor.constraint(equalToConstant: height).isActive = true
        case .horizontal:
            separatorView.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}



#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct SeparatorView_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            SeparatorView()
        }
        .frame(width: UIScreen.main.bounds.width, height: 1.0)
        .previewLayout(.sizeThatFits)
    }
}
#endif
