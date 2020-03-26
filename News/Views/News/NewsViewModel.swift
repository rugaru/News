//
//  NewsViewModel.swift
//  News
//
//  Created by Alina on 20.03.2020.
//  Copyright © 2020 rugarusik. All rights reserved.
//

import Foundation

final class NewsViewModel: ObservableObject {
    private let apiKey = "b7d96eccac2d4c3bad5b5f0dc01cc9f4"
    
    @Published private(set) var items: [Article] = [Article]()
    @Published private(set) var page: Int = 1
    @Published private(set) var isPageLoading: Bool = false
    
    @Published var selectedItem: Int = 0 {
        didSet {
            change(type: contentTypes[selectedItem])
        }
    }
    
    @Published private(set) var contentTypes = ["Music", "Business", "Sport"]
    
    func loadNextNews() {
        NewsAPI.getNews(apiKey: apiKey, q: contentTypes[selectedItem], page: page) { (news, error) in
            if let articles = news?.articles {
                self.items.append(contentsOf: articles)
            }
        }
    }
    
    func change(type: String) {
        self.items.removeAll()
        page = 1
        NewsAPI.getNews(apiKey: apiKey, q: type, page: page) { (news, error) in
            if let articles = news?.articles {
                self.items = articles
            }
        }
    }
}

extension Article: Identifiable {
    
    public var id: String {
        return title ?? UUID().uuidString
    }
    
}
