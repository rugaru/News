//
//  ContentView.swift
//  News
//
//  Created by Alina on 19.03.2020.
//  Copyright © 2020 rugarusik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavControllerView(transition: .custom(.scale)) {
            NewsView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
