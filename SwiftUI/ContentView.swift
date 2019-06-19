//
//  ContentView.swift
//  StoryboardPreviews
//
//  Created by AKIO on 2019/06/17.
//  Copyright © 2019 AKIO. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct ContentView : View {
    var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
@available(iOS 13.0, *)
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
