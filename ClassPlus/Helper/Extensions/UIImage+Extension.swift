//
//  UIImage+Extension.swift
//  Mapprr
//
//  Created by Soumya Jain on 21/02/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import UIKit

extension UIImage {
    func renderingWithAlwaysTemplateMode() -> UIImage {
        return self.withRenderingMode(.alwaysTemplate)
    }
}
