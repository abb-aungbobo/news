//
//  ArticlesView.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import Combine
import ComposableArchitecture
import SwiftUI

struct ArticlesView: View {
    let store: Store<ArticlesState, ArticlesAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewStore.articles) { article in
                        AppRouter(to: .article(article)) {
                            ArticleCardView(viewModel: article.toArticleCardViewModel())
                        }
                    }
                }
            }
            .navigationTitle("News")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewStore.send(.getTopHeadlines)
            }
            .alert(
                store.scope(state: \.alert),
                dismiss: .errorAlertDismissed
            )
        }
    }
}
