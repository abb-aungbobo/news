//
//  Article.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import Foundation

struct Article: Identifiable, Equatable, Hashable {
    var id: String { url }
    
    let source: Source
    let title: String
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    
    static var fake: Article {
        return Articles.fake.articles.randomElement()!
    }
}

extension Article {
    func toArticleCardViewModel() -> ArticleCardViewModel {
        var imageURL: URL?
        if let urlToImage {
            imageURL = URL(string: urlToImage)
        }
        let publishedAt = publishedAt.formatted(.relative(presentation: .numeric, unitsStyle: .abbreviated))
        let subtitle = "\(source.name) • \(publishedAt)"
        return ArticleCardViewModel(imageURL: imageURL, title: title, subtitle: subtitle)
    }
    
    func toArticleViewModel() -> ArticleViewModel {
        let url = URL(string: url)!
        return ArticleViewModel(articleURL: url)
    }
}
