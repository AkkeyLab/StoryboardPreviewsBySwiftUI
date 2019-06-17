//
//  NSObject+Apply.swift
//  StoryboardPreviews
//
//  Created by AKIO on 2019/06/17.
//  Copyright © 2019 AKIO. All rights reserved.
//

import Foundation

protocol Appliable {}

extension Appliable {
    @discardableResult
    func apply(closure: (_ this: Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

extension NSObject: Appliable {}
