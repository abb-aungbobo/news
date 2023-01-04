//
//  NetworkController.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import Combine
import Foundation

class NetworkController {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    static let shared = NetworkController()
    
    private init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    private func request<T: Codable>(for request: URLRequest) -> AnyPublisher<T, AppError> {
        var request = request
        request.setValue(Constants.apiKey, forHTTPHeaderField: "Authorization")
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap({ [weak self] (data: Data, response: URLResponse) in
                guard let self else { throw AppError.generic }
                if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
                    let response = try self.decoder.decode(T.self, from: data)
                    return response
                } else {
                    let response = try self.decoder.decode(ErrorResponse.self, from: data)
                    let error = response.toAppError()
                    throw error
                }
            })
            .mapError({ error in error.toAppError() })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func get<ResponseType: Codable>(endpoint: Endpoint) -> AnyPublisher<ResponseType, AppError> {
        var urlRequest = URLRequest(url: endpoint.url)
        urlRequest.httpMethod = endpoint.httpMethod.rawValue
        return request(for: urlRequest)
    }
}
