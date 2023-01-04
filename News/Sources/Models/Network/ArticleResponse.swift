//
//  ArticleResponse.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import Foundation

struct ArticleResponse: Codable {
    let source: SourceResponse
    let title: String
    let url: String
    let urlToImage: String?
    let publishedAt: Date
}

extension ArticleResponse {
    func toArticle() -> Article {
        return Article(
            source: source.toSource(),
            title: title,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt
        )
    }
}

extension Array where Element == ArticleResponse {
    func toArticles() -> [Article] {
        return map { response in
            return response.toArticle()
        }
    }
}
