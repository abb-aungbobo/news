//
//  ArticlesState.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import ComposableArchitecture

struct ArticlesState: Equatable {
    let title: String = "News"
    var alert: AlertState<ArticlesAction>?
    var articles: [Article] = []
}
