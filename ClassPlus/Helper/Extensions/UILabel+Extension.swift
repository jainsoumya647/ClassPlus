//
//  UILabel+Extension.swift
//  Blog
//
//  Created by Soumya on 14/01/20.
//  Copyright © 2020 Soumya. All rights reserved.
//

import UIKit

extension UILabel {

    func configureHeaderLabel(font:Font = .extraBold, fontSize size: CGFloat) {
        self.font = UIFont(name: font.rawValue, size: size)
        self.textColor = UIColor.textColor
    }

    func configureWithThemeBlueColor(font:Font = .medium, fontSize size: CGFloat, text: String = "") {
        self.font = UIFont(name: font.rawValue, size: size)
        self.textColor = UIColor.headerTextBlueColor
        self.text = text
    }

    func configurePlaceholderLabel(font:Font = .medium, fontSize size: CGFloat) {
        self.font = UIFont(name: font.rawValue, size: size)
        self.textColor = UIColor.placeholderGrayColor
    }
}
