//
//  ThirdView.swift
//  News
//
//  Created by Alina on 24.03.2020.
//  Copyright © 2020 rugarusik. All rights reserved.
//

import SwiftUI
import Combine

struct ThirdView: View {
    private let url: String?
    
    init(url: String?) {
        self.url = url
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                NavPopButton(destination: .previous) {
                    Image(systemName: "xmark.circle")
                        .font(.largeTitle)
                }
            }
            .padding(.top, 16)
            .padding(.trailing, 16)
            
            Spacer()
            
            AsyncImage(
                url: URL(string: url!)!,
                placeholder: Text("Loading ...")
            ).aspectRatio(contentMode: .fit)
            
            Spacer()
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView(url: nil)
    }
}
