//
//  DetailedNewsView.swift
//  News
//
//  Created by Alina on 24.03.2020.
//  Copyright © 2020 rugarusik. All rights reserved.
//

import SwiftUI

struct DetailedNewsView: View {
    var article: Article
    
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
            
            Text(article.title ?? "")
                .font(.largeTitle).padding(.top, 16)
            Text(article.content ?? "")
                .font(.body).padding(.top, 16)
            
            NavPushButton(destination: ThirdView(url: article.urlToImage)) {
                Text("Show Image")
                    .font(.headline)
            }
            .padding(.top, 16)
            
            Spacer()
            
        }//VStack
    }
}

struct DetailedNews_Previews: PreviewProvider {
    static var previews: some View {
        DetailedNewsView(article: Article(author: nil,
                                          title: "Test",
                                          articleDescription: "Test",
                                          source: nil,
                                          url: "Test",
                                          urlToImage: "Test",
                                          content: "Test"))
    }
}
