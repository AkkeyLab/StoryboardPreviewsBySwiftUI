//
//  UserDetailBasicInfoCell.swift
//  StoryboardPreviews
//
//  Created by AKIO on 2019/06/17.
//  Copyright © 2019 AKIO. All rights reserved.
//

import UIKit

final class UserDetailBasicInfoCell: UITableViewCell {
    private enum Const {
        static let ageAndLocationFont: UIFont = .boldSystemFont(ofSize: 14)
        static let ageVerifiedFont: UIFont = .boldSystemFont(ofSize: 12)
        static let cornerRadius: CGFloat = 16
        static let pictureSpace: CGFloat = 4
    }

    private let leftCircleView = UserDetailImageCircleView.create()
    private let centerCircleView = UserDetailImageCircleView.create()
    private let rightCircleView = UserDetailImageCircleView.create()
    private var selectingImageUrl: String?

    @IBOutlet private weak var newBadgeView: UIView!
    @IBOutlet private weak var newBadgeHeight: NSLayoutConstraint! {
        didSet {
            let widthSizeType = DeviceWidthSizeType(size: UIScreen.main.bounds.size)
            newBadgeHeight.constant = widthSizeType.newBadgeHeight
        }
    }
    @IBOutlet private weak var nameLabel: UILabel! {
        didSet {
            nameLabel.apply { this in
                let widthSizeType = DeviceWidthSizeType(size: UIScreen.main.bounds.size)
                this.font = widthSizeType.nameFont
                this.textColor = #colorLiteral(red: 0.1882352941, green: 0.2392156863, blue: 0.3137254902, alpha: 0.9)
            }
        }
    }
    @IBOutlet private weak var ageAndLocationLabel: UILabel! {
        didSet {
            ageAndLocationLabel.apply { this in
                this.font = Const.ageAndLocationFont
                this.textColor = #colorLiteral(red: 0.1882352941, green: 0.2392156863, blue: 0.3137254902, alpha: 0.65)
            }
        }
    }
    @IBOutlet private weak var loginStatusBaseView: UIView! {
        didSet {
            loginStatusBaseView.isHidden = true
        }
    }
    @IBOutlet private weak var loginStatusView: UIView! {
        didSet {
            loginStatusView.apply { this in
                this.backgroundColor = #colorLiteral(red: 0.431372549, green: 0.8980392157, blue: 0.4235294118, alpha: 1)
                this.layer.cornerRadius = this.bounds.width / 2
            }
        }
    }
    @IBOutlet private weak var ageVerifiedWrapView: UIView! {
        didSet {
            ageVerifiedWrapView.isHidden = true
        }
    }
    @IBOutlet private weak var ageVerifiedIconImageView: UIImageView! {
        didSet {
            ageVerifiedIconImageView.apply { this in
                this.image = ageVerifiedIconImageView.image?.withRenderingMode(.alwaysTemplate)
                this.tintColor = #colorLiteral(red: 0.3098039216, green: 0.7137254902, blue: 0.7137254902, alpha: 1)
            }
        }
    }
    @IBOutlet private weak var ageVerifiedLabel: UILabel! {
        didSet {
            ageVerifiedLabel.apply { this in
                let widthSizeType = DeviceWidthSizeType(size: UIScreen.main.bounds.size)
                this.isHidden = widthSizeType == .small
                this.font = Const.ageVerifiedFont
                this.text = "年確済み"
                this.textColor = #colorLiteral(red: 0.3098039216, green: 0.7137254902, blue: 0.7137254902, alpha: 1)
            }
        }
    }
    @IBOutlet private weak var leftWrapView: UIView! {
        didSet {
            leftWrapView.addSubview(leftCircleView)
            leftCircleView.ak.adjustSuperView(isSafeArea: false)
        }
    }
    @IBOutlet private weak var centerWrapView: UIView! {
        didSet {
            centerWrapView.addSubview(centerCircleView)
            centerCircleView.ak.adjustSuperView(isSafeArea: false)
        }
    }
    @IBOutlet private weak var rightWrapView: UIView! {
        didSet {
            rightWrapView.addSubview(rightCircleView)
            rightCircleView.ak.adjustSuperView(isSafeArea: false)
        }
    }
    @IBOutlet private weak var wrapViewWidth: NSLayoutConstraint!
    @IBOutlet private weak var pictureStackView: UIStackView!

    func prepare(user: User, selectingImageUrl: String?) {
        prepareUI()

        nameLabel.text = user.name
        ageAndLocationLabel.text = user.ageLocation
        newBadgeView.isHidden = !user.isNew
        ageVerifiedWrapView.isHidden = user.ageVerifyStatus != .ok
        loginStatusBaseView.isHidden = false

        zip(user.picture.all, circleViews).forEach { url, circleView in
            circleView.isHidden = url.isEmpty
            circleView.superview?.isHidden = url.isEmpty
            if !url.isEmpty {
                circleView.prepareUI(url: url)
            }
        }

        let validCount = circleViews.count { !$0.isHidden }
        wrapViewWidth.constant = validCount > 1 ? (UserDetailImageCircleView.subPhotoDiameter + Const.pictureSpace) * CGFloat(validCount) + pictureStackView.spacing * CGFloat(validCount - 1) : 0

        if user.picture.all.count(where: { !$0.isEmpty }) <= 1 {
            circleViews.forEach { $0.isHidden = true }
        }

        if let selectingImageUrl = selectingImageUrl {
            selectSubImageView(url: selectingImageUrl)
        } else {
            selectLeftImageView()
        }
    }

    private func prepareUI() {
        self.layer.masksToBounds = true
        self.ak.setTopCornerRadius(radius: Const.cornerRadius)
        self.selectionStyle = .none
    }

    private func selectSubImageView(url: String) {
        if let urlPath = url.urlPath, let circleView = circleViews.first(where: { $0.urlString?.urlPath == urlPath }) {
            tapSubImageView(circleView: circleView)
        } else if !circleViews.filter({ !$0.isHidden }).isEmpty {
            selectLeftImageView()
        }
    }

    private func selectLeftImageView() {
        tapSubImageView(circleView: circleViews.first { !$0.isHidden } ?? leftCircleView)
    }

    private var circleViews: [UserDetailImageCircleView] {
        return [leftCircleView, centerCircleView, rightCircleView]
    }

    private func tapSubImageView(circleView: UserDetailImageCircleView) {
        selectingImageUrl = circleView.urlString
        circleViews.forEach { $0.isSelect = false }
        circleView.isSelect = true
    }
}

private extension DeviceWidthSizeType {
    var newBadgeHeight: CGFloat {
        switch self {
        case .large, .normal:
            return 24
        case .small:
            return 20
        }
    }

    var nameFont: UIFont {
        switch self {
        case .large, .normal:
            return UIFont.boldSystemFont(ofSize: 24)
        case .small:
            return UIFont.boldSystemFont(ofSize: 22)
        }
    }
}
