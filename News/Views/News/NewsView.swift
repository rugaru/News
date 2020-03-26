//
//  NewsView.swift
//  News
//
//  Created by Alina on 20.03.2020.
//  Copyright © 2020 rugarusik. All rights reserved.
//

import SwiftUI

struct NewsView: View {
    
    @EnvironmentObject var newsViewModel: NewsViewModel
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                Picker("Types", selection: $newsViewModel.selectedItem) {
                    ForEach(0 ..< newsViewModel.contentTypes.count) { index in
                        Text(self.newsViewModel.contentTypes[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                
                List(newsViewModel.items) { item in
                    NavPushButton(destination: DetailedNewsView(article: item)) {
                        VStack(alignment: .leading) {
                            NewsRow(item: item)
                                .onAppear() {
                                    if self.newsViewModel.items.isLast(item) {
                                        self.newsViewModel.loadNextNews()
                                    }
                            }
                        }
                    }
                }
                .navigationBarTitle("News")
                .onAppear() {
                    self.newsViewModel.loadNextNews()
                }
            } // VStack
            
        } // NavigationView
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
