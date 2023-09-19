//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 06.09.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

extension UIDevice {
    static let isiPhone = UIDevice.current.userInterfaceIdiom == .phone
}
