//
//  Endpoint.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import Foundation

struct Endpoint {
    let scheme: String
    let host: String
    let path: String
    let queryItems: [URLQueryItem]?
    let httpMethod: HTTPMethod
    
    var url: URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }
    
    init(scheme: String = "https", host: String, path: String, queryItems: [URLQueryItem]? = nil, httpMethod: HTTPMethod) {
        self.scheme = scheme
        self.host = host
        self.path = path
        self.queryItems = queryItems
        self.httpMethod = httpMethod
    }
}

extension Endpoint {
    static func newsapi(path: String, queryItems: [URLQueryItem] = [], httpMethod: HTTPMethod = .get) -> Endpoint {
        let host = "newsapi.org"
        let version = "/v2"
        let path = version + path
        return Endpoint(host: host, path: path, queryItems: queryItems, httpMethod: httpMethod)
    }
}
