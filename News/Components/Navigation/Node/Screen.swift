//
//  Screen.swift
//  News
//
//  Created by Alina on 24.03.2020.
//  Copyright © 2020 rugarusik. All rights reserved.
//

import SwiftUI

struct Screen: Identifiable, Equatable {
    
    let id: String
    let nextScreen: AnyView
    
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
}
