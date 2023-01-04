//
//  ArticlesView.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import ComposableArchitecture
import SwiftUI

typealias ArticlesStore = Store<ArticlesState, ArticlesAction>
typealias ArticlesViewStore = ViewStore<ArticlesState, ArticlesAction>

struct ArticlesView: View {
    let store: ArticlesStore
    
    var body: some View {
        WithViewStore(store) { viewStore in
            scrollView(viewStore: viewStore)
                .navigationTitle(viewStore.title)
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    viewStore.send(.getTopHeadlines)
                }
                .alert(store.scope(state: \.alert), dismiss: .errorAlertDismissed)
        }
    }
    
    private func scrollView(viewStore: ArticlesViewStore) -> some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                articles(viewStore: viewStore)
            }
        }
    }
    
    private func articles(viewStore: ArticlesViewStore) -> some View {
        ForEach(viewStore.articles) { article in
            NavigationLink(value: Route.article(article)) {
                ArticleCardView(viewModel: article.toArticleCardViewModel())
            }
        }
    }
}

struct ArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesScene.mock()
    }
}
