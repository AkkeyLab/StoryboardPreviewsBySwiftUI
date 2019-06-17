//
//  String+url.swift
//  StoryboardPreviews
//
//  Created by AKIO on 2019/06/17.
//  Copyright © 2019 AKIO. All rights reserved.
//

import Foundation

extension String {
    var urlPath: String? {
        return URL(string: self)?.path
    }
}
