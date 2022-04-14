//
//  AppRouter.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import SwiftUI

struct AppRouter<Content>: View where Content: View {
    enum Destination {
        case article(Article)
    }
    
    private let destination: Destination
    private let content: Content
    
    init(
        to destination: Destination,
        @ViewBuilder content: () -> Content
    ) {
        self.destination = destination
        self.content = content()
    }
    
    var body: some View {
        NavigationLink {
            switch destination {
            case let .article(article):
                ArticleScene.create(article: article)
            }
        } label: {
            content
        }
    }
}
