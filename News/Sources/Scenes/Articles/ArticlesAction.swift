//
//  ArticlesAction.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import Foundation

enum ArticlesAction: Equatable {
    case getTopHeadlines
    case errorAlertDismissed
    case succeeded(Result<Articles, AppError>)
}
