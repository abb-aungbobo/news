//
//  Articles.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import Foundation

struct Articles: Equatable {
    let articles: [Article]
    
    static var fake: Articles {
        let response: ArticlesResponse = try! JSON.decode(from: "top-headlines")
        return response.toArticles()
    }
}
