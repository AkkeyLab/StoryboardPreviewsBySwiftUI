//
//  Collection+AK.swift
//  StoryboardPreviews
//
//  Created by AKIO on 2019/06/17.
//  Copyright © 2019 AKIO. All rights reserved.
//

extension Collection {
    func count(where predicate: (Iterator.Element) -> Bool) -> Int {
        return self.filter(predicate).count
    }
}
