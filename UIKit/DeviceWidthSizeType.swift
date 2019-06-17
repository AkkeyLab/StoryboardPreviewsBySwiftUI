//
//  DeviceWidthSizeType.swift
//  StoryboardPreviews
//
//  Created by AKIO on 2019/06/17.
//  Copyright © 2019 AKIO. All rights reserved.
//

import CoreGraphics

enum DeviceWidthSizeType {
    case small
    case normal
    case large

    private enum Const {
        static let maxSmallWidth: CGFloat = 360
        static let maxNormalWidth: CGFloat = 400
    }

    init(size: CGSize) {
        switch size.width {
        case let width where width <= Const.maxSmallWidth:
            self = .small
        case let width where width <= Const.maxNormalWidth:
            self = .normal
        default:
            self = .large
        }
    }
}
