//
//  NavPushButton.swift
//  News
//
//  Created by Alina on 25.03.2020.
//  Copyright © 2020 rugarusik. All rights reserved.
//

import SwiftUI

struct NavPushButton<Label, Destination>: View where Label: View, Destination: View {
    
    @EnvironmentObject private var viewModel: NavControllerViewModel
    
    private let destination: Destination
    private let label: Label

    init(destination: Destination, @ViewBuilder label: @escaping () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        label.onTapGesture {
            self.push()
        }
    }
    
    private func push() {
        viewModel.push(destination)
    }
}

struct NavPushButton_Previews: PreviewProvider {
    static var previews: some View {
        NavPopButton(destination: .previous) {
            Text("Test")
        }
    }
}
