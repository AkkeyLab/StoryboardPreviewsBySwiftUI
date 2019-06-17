//
//  NSObject+Apply.swift
//  AkkeyTV
//
//  Created by AKIO on 2018/12/16.
//  Copyright © 2018 AKIO. All rights reserved.
//

import Foundation

public protocol Appliable {}

extension Appliable {
    @discardableResult
    public func apply(closure: (_ this: Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

extension NSObject: Appliable {}
