//
//  Extension+UIViewController.swift
//  ScrollViewCollectionHeight
//
//  Created by jiwon Yoon on 2023/01/09.
//

import Foundation
import UIKit

enum DeviceType {
    case iPhoneSE2
    case iPhone8
    case iPhone12Pro
    case iPhone12ProMax
    case iPhone13Pro
    case iPhone13
    case iPhone13ProMax
    case iPhone13Mini
    
    func name() -> String {
        switch self {
        case .iPhoneSE2:
            return "iPhone SE"
        case .iPhone8:
            return "iPhone 8"
        case .iPhone12Pro:
            return "iPhone 12 Pro"
        case .iPhone12ProMax:
            return "iPhone 12 Pro Max"
        case .iPhone13Pro:
            return "iPhone 13 Pro"
        case .iPhone13:
            return "iPhone 13"
        case .iPhone13ProMax:
            return "iPhone 13 Pro Max"
        case .iPhone13Mini:
            return "iPhone 13 Mini"
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
    
    func showPreview(_ deviceType: DeviceType = .iPhone13Pro) -> some View {
        Preview(viewController: self).previewDevice(PreviewDevice(rawValue: deviceType.name()))
    }
}
#endif
