//
//  Endpoints.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import Foundation

enum Endpoints {
    static func getTopHeadlines() -> Endpoint {
        let path = "/top-headlines"
        let country = URLQueryItem(name: "country", value: "us")
        return .newsapi(path: path, queryItems: [country])
    }
}
