//
//  ErrorResponse.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import Foundation

struct ErrorResponse: Codable {
    let status: String
    let code: String
    let message: String
}

extension ErrorResponse: LocalizedError {
    var errorDescription: String? { message }
}
