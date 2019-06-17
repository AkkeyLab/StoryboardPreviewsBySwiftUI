//
//  User.swift
//  StoryboardPreviews
//
//  Created by AKIO on 2019/06/17.
//  Copyright © 2019 AKIO. All rights reserved.
//

import Foundation

struct User: Equatable {
    let id: Int
    let name: String
    let location: Location
    let birthday: Date
    let picture: User.Picture
    var ageVerifyStatus: User.AgeVerifyStatus
    let isNew: Bool

    init(id: Int,
         name: String,
         location: Location,
         birthday: Date,
         picture: User.Picture,
         ageVerifyStatus: User.AgeVerifyStatus,
         isNew: Bool) {
        self.id = id
        self.name = name
        self.location = location
        self.birthday = birthday
        self.picture = picture
        self.ageVerifyStatus = ageVerifyStatus
        self.isNew = isNew
    }
}

extension User {
    struct Picture: Equatable {
        let main: String
        let sub1: String
        let sub2: String

        init(main: String, sub1: String, sub2: String) {
            self.main = main
            self.sub1 = sub1
            self.sub2 = sub2
        }

        var all: [String] {
            return [main, sub1, sub2]
        }
    }

    struct Location: Equatable {
        enum Const {
            static let list: [Int: String] = [
                1: "北海道", 2: "青森", 3: "岩手", 4: "宮城", 5: "秋田", 6: "山形", 7: "福島", 8: "茨城", 9: "栃木", 10: "群馬",
                11: "埼玉", 12: "千葉", 13: "東京", 14: "神奈川", 15: "新潟", 16: "富山", 17: "石川", 18: "福井", 19: "山梨",
                20: "長野", 21: "岐阜", 22: "静岡", 23: "愛知", 24: "三重", 25: "滋賀", 26: "京都", 27: "大阪", 28: "兵庫",
                29: "奈良", 30: "和歌山", 31: "鳥取", 32: "島根", 33: "岡山", 34: "広島", 35: "山口", 36: "徳島", 37: "香川",
                38: "愛媛", 39: "高知", 40: "福岡", 41: "佐賀", 42: "大分", 43: "宮崎", 44: "長崎", 45: "熊本", 46: "鹿児島",
                47: "沖縄", 48: "その他"]
        }

        let id: Int
        let name: String

        init(id: Int, name: String) {
            self.id = id
            self.name = name
        }
    }

    enum AgeVerifyStatus {
        case none
        case checking
        case ok

        init(string: String) {
            switch string {
            case "ok":
                self = .ok
            case "unchecked":
                self = .checking
            case "ng":
                self = .none
            default:
                self = .none
            }
        }
    }

    var ageLocation: String {
        return "\(birthday.age)歳・\(location.name)"
    }
}

