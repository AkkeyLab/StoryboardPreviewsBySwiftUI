//
//  UserDetailImageCircleView.swift
//  StoryboardPreviews
//
//  Created by AKIO on 2019/06/17.
//  Copyright © 2019 AKIO. All rights reserved.
//

import UIKit

final class UserDetailImageCircleView: UIView {

    private enum Const {
        static let selectedWidth: CGFloat = 4
        static let unSelectWidth: CGFloat = 0
        static let margin: CGFloat = 4
    }

    var image: UIImage? {
        return imageView.image
    }

    private(set) var urlString: String?

    @IBOutlet private weak var imageView: UIImageView! {
        didSet {
            imageView.apply { this in
                this.layer.cornerRadius = UserDetailImageCircleView.subPhotoDiameter / 2
                this.layer.borderColor = #colorLiteral(red: 0.1882352941, green: 0.2392156863, blue: 0.3137254902, alpha: 0.1)
                this.layer.borderWidth = 1
            }
        }
    }
    @IBOutlet private weak var imageViewWidth: NSLayoutConstraint! {
        didSet {
            imageViewWidth.constant = UserDetailImageCircleView.subPhotoDiameter
        }
    }

    static func create() -> Self {
        return self.instantiate().apply { this in
            this.layer.cornerRadius = (UserDetailImageCircleView.subPhotoDiameter + Const.margin) / 2
        }
    }

    static var subPhotoDiameter: CGFloat {
        return DeviceWidthSizeType(size: UIScreen.main.bounds.size).subPhotoDiameter
    }

    var isSelect = false {
        didSet {
            self.layer.apply { this in
                this.borderColor = #colorLiteral(red: 0.9176470588, green: 0.2980392157, blue: 0.537254902, alpha: 1)
                this.borderWidth = isSelect ? Const.selectedWidth : Const.unSelectWidth
            }
        }
    }

    func prepareUI(url: String) {
        urlString = url
        imageView.isHidden = url.isEmpty
        if !url.isEmpty {
            imageView.image = UIImage(url: url)
        }
    }
}

private extension DeviceWidthSizeType {
    var subPhotoDiameter: CGFloat {
        switch self {
        case .small:
            return 44
        case .normal, .large:
            return 52
        }
    }
}
