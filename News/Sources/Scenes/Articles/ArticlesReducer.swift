//
//  ArticlesReducer.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import ComposableArchitecture

let articlesReducer = Reducer<
    ArticlesState,
    ArticlesAction,
    ArticlesEnvironment
> { state, action, environment in
    switch action {
    case .getTopHeadlines:
        return environment.articleService.getTopHeadlines()
            .eraseToEffect()
            .catchToEffect()
            .map(ArticlesAction.succeeded)
    case .errorAlertDismissed:
        state.alert = nil
        return .none
    case let.succeeded(result):
        switch result {
        case let .success(articles):
            state.articles = articles.articles
        case let .failure(error):
            state.alert = error.toAlertState()
        }
        return .none
    }
}
