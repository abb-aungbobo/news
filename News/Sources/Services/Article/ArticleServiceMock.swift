//
//  ArticleServiceMock.swift
//  News
//
//  Created by Aung Bo Bo on 05/11/2022.
//

import Combine

class ArticleServiceMock: ArticleService {
    func getTopHeadlines() -> AnyPublisher<Articles, AppError> {
        do {
            let response: ArticlesResponse = try JSON.decode(from: "top-headlines")
            return Just(response.toArticles())
                .setFailureType(to: AppError.self)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error.toAppError())
                .eraseToAnyPublisher()
        }
    }
}
