//
//  UIBarButtonItem+CustomView.swift
//  CarrotHomeTab
//
//  Created by Songhee Choi on 2022/07/25.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    static func generate(with config: CustomBarItemConfiguration, width: CGFloat? = nil) -> UIBarButtonItem {
        let customView = CustomBarItem(config: config)
       
        // 넓이 들어올 때만 설정 하게 함
        if let width = width {
            NSLayoutConstraint.activate([
                customView.widthAnchor.constraint(equalToConstant: width)
            ])
        }
        let barbuttonItem = UIBarButtonItem(customView: customView)
        return barbuttonItem
    }
}
