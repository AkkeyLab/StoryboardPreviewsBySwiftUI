//
//  UIViewController+AK.swift
//  StoryboardPreviews
//
//  Created by AKIO on 2019/06/17.
//  Copyright © 2019 AKIO. All rights reserved.
//

import UIKit

protocol StoryboardInstantiatable {}
protocol NibInstantiatable {}
extension UIViewController: StoryboardInstantiatable {}
extension UIView: NibInstantiatable {}

// swiftlint:disable force_cast
extension StoryboardInstantiatable where Self: UIViewController {
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: Bundle.main)
        return storyboard.instantiateInitialViewController() as! Self
    }
}

extension NibInstantiatable where Self: UIView {
    static func instantiate() -> Self {
        let nib = UINib(nibName: String(describing: String(describing: self)), bundle: nil)
        return nib.instantiate(withOwner: nil, options: nil)[0] as! Self
    }
}
// swiftlint:enable force_cast
