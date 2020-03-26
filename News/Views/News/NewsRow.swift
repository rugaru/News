//
//  NewsRow.swift
//  News
//
//  Created by Alina on 25.03.2020.
//  Copyright © 2020 rugarusik. All rights reserved.
//

import SwiftUI

struct NewsRow: View {
    
    @EnvironmentObject var viewModel: NewsViewModel
    
    let item: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title ?? "")
                .font(.headline)
            
            Text(item.content ?? "")
                .font(.callout)
                .foregroundColor(.gray)
            
            if self.viewModel.isPageLoading && self.viewModel.items.isLast(item) {
                Divider()
                Text("Loading...")
            }
        }
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(item: Article(author: nil,
                              title: "Test",
                              articleDescription: "Test",
                              source: nil,
                              url: "Test",
                              urlToImage: "Test",
                              content: "Test"))
    }
}
