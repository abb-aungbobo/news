//
//  JSON.swift
//  News
//
//  Created by Aung Bo Bo on 05/11/2022.
//

import Foundation

enum JSON {
    static func decode<T: Codable>(from file: String) throws -> T {
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    }
}
