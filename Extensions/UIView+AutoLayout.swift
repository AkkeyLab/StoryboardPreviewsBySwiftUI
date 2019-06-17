//
//  UIView+AutoLayout.swift
//  StoryboardPreviews
//
//  Created by AKIO on 2019/06/17.
//  Copyright © 2019 AKIO. All rights reserved.
//

import UIKit

struct ViewOuterConstraints {
    let top: NSLayoutConstraint
    let bottom: NSLayoutConstraint
    let left: NSLayoutConstraint
    let right: NSLayoutConstraint
}

protocol Ancherable {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: Ancherable {}
extension UILayoutGuide: Ancherable {}

extension Akkey where Base: UIView {
    @discardableResult
    func adjustSuperView(_ superView: UIView? = nil, isSafeArea: Bool) -> ViewOuterConstraints? {
        guard let superView = superView ?? base.superview else { return nil }
        let layoutGuide: Ancherable = isSafeArea ? superView.safeAreaLayoutGuide : superView
        var constraints: ViewOuterConstraints?
        base.apply { this in
            this.translatesAutoresizingMaskIntoConstraints = false
            constraints = ViewOuterConstraints(
                top: this.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
                bottom: this.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
                left: this.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
                right: this.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor)
            )
            constraints?.activate()
        }
        return constraints
    }
}

extension ViewOuterConstraints {
    func activate() {
        NSLayoutConstraint.activate([top, bottom, left, right])
    }
}
