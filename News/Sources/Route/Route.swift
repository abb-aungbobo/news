//
//  Route.swift
//  News
//
//  Created by Aung Bo Bo on 05/11/2022.
//

import SwiftUI

enum Route: Hashable {
    case article(Article)
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case let .article(article):
            ArticleScene.create(article: article)
        }
    }
}
