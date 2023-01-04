//
//  AppError.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import ComposableArchitecture

enum AppError: Equatable, LocalizedError {
    case generic
    case networking
    case encoding
    case decoding
    case failure(Error)
    
    var errorDescription: String? {
        switch self {
        case .generic: return "Something went wrong"
        case .networking: return "Request to server failed"
        case .encoding: return "Failed parsing request to server"
        case .decoding: return "Failed parsing response from server"
        case let .failure(error): return error.localizedDescription
        }
    }
    
    static func == (lhs: AppError, rhs: AppError) -> Bool {
        return self == self
    }
}

extension AppError {
    func toAlertState<Action>() -> AlertState<Action> {
        return AlertState(
            title: TextState("Oops!"),
            message: TextState(localizedDescription),
            dismissButton: .cancel(TextState("Dismiss"))
        )
    }
}
