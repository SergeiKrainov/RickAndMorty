//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 23.04.2023.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
