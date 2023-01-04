//
//  ArticlesScene.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import ComposableArchitecture

enum ArticlesScene {
    static func create() -> ArticlesView {
        let initialState = ArticlesState()
        let articleService = ArticleServiceImpl()
        let environment = ArticlesEnvironment(articleService: articleService)
        let store = Store(initialState: initialState, reducer: articlesReducer, environment: environment)
        let view = ArticlesView(store: store)
        return view
    }
    
    static func mock() -> ArticlesView {
        let initialState = ArticlesState()
        let articleService = ArticleServiceMock()
        let environment = ArticlesEnvironment(articleService: articleService)
        let store = Store(initialState: initialState, reducer: articlesReducer, environment: environment)
        let view = ArticlesView(store: store)
        return view
    }
}
