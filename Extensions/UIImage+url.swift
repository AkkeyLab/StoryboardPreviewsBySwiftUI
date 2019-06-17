//
//  UIImage+url.swift
//  StoryboardPreviews
//
//  Created by AKIO on 2019/06/17.
//  Copyright © 2019 AKIO. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init?(url: String) {
        guard let url = URL(string: url) else {
            self.init()
            return
        }
        do {
            let data = try Data(contentsOf: url)
            self.init(data: data)
            return
        } catch let error {
            debugPrint(error.localizedDescription)
        }
        self.init()
    }
}
