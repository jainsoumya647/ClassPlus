//
//  CGFloat+Extension.swift
//  Blog
//
//  Created by Soumya on 13/01/20.
//  Copyright © 2020 Soumya. All rights reserved.
//

import UIKit

extension CGFloat {

    func configureAccordingToScreen() -> CGFloat {
        return self*UIScreen.main.bounds.width/414
    }

}
