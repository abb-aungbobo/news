//
//  ArticlesResponse.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import Foundation

struct ArticlesResponse: Codable {
    let articles: [ArticleResponse]
}

extension ArticlesResponse {
    func toArticles() -> Articles {
        return Articles(articles: articles.toArticles())
    }
}
