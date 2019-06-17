//
//  UIView+AK.swift
//  StoryboardPreviews
//
//  Created by AKIO on 2019/06/17.
//  Copyright © 2019 AKIO. All rights reserved.
//

import UIKit

extension Akkey where Base: UIView {
    func setTopCornerRadius(radius: CGFloat) {
        base.layer.cornerRadius = radius
        base.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
