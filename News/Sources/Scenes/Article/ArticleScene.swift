//
//  ArticleScene.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import Foundation

enum ArticleScene {
    static func create(article: Article) -> ArticleView {
        let viewModel = article.toArticleViewModel()
        let view = ArticleView(viewModel: viewModel)
        return view
    }
}
