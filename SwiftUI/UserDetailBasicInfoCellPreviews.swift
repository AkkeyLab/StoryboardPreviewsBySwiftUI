//
//  UserDetailBasicInfoCellPreviews.swift
//  StoryboardPreviews
//
//  Created by AKIO on 2019/06/17.
//  Copyright © 2019 AKIO. All rights reserved.
//

import SwiftUI
import UIKit

#if DEBUG
struct UserDetailBasicInfoCellPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            UserDetailBasicInfoCell()
                .previewLayout(.fixed(width: 320, height: 100))
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            UserDetailBasicInfoCell()
                .previewLayout(.fixed(width: 414, height: 100))
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
        }
    }

    static var platform: PreviewPlatform? = .iOS
}

extension UserDetailBasicInfoCell: UIViewRepresentable {
    typealias UIViewType = UserDetailBasicInfoCell

    func makeUIView(context: Context) -> UserDetailBasicInfoCell {
        return Self.instantiate()
    }

    func updateUIView(_ uiView: UserDetailBasicInfoCell, context: Context) {
        let base = "https://en.gravatar.com/userimage/106977602/"
        let picture = User.Picture(
            main: "\(base)61f3892006c8d22402d9c08d81629541.jpg?size=200",
            sub1: "\(base)835526449c489c081a52c38e79ac42c9.png?size=200",
            sub2: "\(base)8d6abaa1a0061356292c312248502f83.jpg?size=200")
        let user = User(id: 0,
                        name: "AKKEY",
                        location: User.Location(id: 13, name: "東京"),
                        birthday: Date(),
                        picture: picture,
                        ageVerifyStatus: User.AgeVerifyStatus(string: "ok"),
                        isNew: true)
        uiView.prepare(user: user, selectingImageUrl: nil)
    }
}
#endif
