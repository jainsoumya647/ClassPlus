//
//  UIView+Extension.swift
//  Blog
//
//  Created by Soumya on 14/01/20.
//  Copyright © 2020 Soumya. All rights reserved.
//

import UIKit

extension UIView {

    func setCornerRadius(radius: CGFloat = 5) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }

    func setCornerRadiusAndShadow(radius: CGFloat = 5) {

        // set the shadow of the view's layer
//        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 4)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4.0

    }
}
