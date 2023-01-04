//
//  ArticleServiceImpl.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import Combine

class ArticleServiceImpl: ArticleService {
    private let networkController: NetworkController
    
    init(networkController: NetworkController = NetworkController.shared) {
        self.networkController = networkController
    }
    
    func getTopHeadlines() -> AnyPublisher<Articles, AppError> {
        let endpoint = Endpoints.getTopHeadlines()
        let publisher: AnyPublisher<ArticlesResponse, AppError> = networkController.get(endpoint: endpoint)
        return publisher
            .map({ response in response.toArticles() })
            .eraseToAnyPublisher()
    }
}
