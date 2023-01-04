//
//  SourceResponse.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import Foundation

struct SourceResponse: Codable {
    let name: String
}

extension SourceResponse {
    func toSource() -> Source {
        return Source(name: name)
    }
}
