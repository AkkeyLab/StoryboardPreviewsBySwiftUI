//
//  ExtensionBase.swift
//  StoryboardPreviews
//
//  Created by AKIO on 2019/06/17.
//  Copyright © 2019 AKIO. All rights reserved.
//

import Foundation

// swiftlint:disable identifier_name
struct Akkey<Base> {
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

protocol AkkeyCompatible {
    associatedtype CompatibleType
    static var ak: Akkey<CompatibleType>.Type { get set }
    var ak: Akkey<CompatibleType> { get set }
}

extension AkkeyCompatible {
    static var ak: Akkey<Self>.Type {
        get { return Akkey<Self>.self }
        set {}
    }
    var ak: Akkey<Self> {
        get { return Akkey(self) }
        set {}
    }
}
// swiftlint:enable identifier_name

extension NSObject: AkkeyCompatible {}
