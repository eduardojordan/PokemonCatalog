//
//  ErrorHandler.swift
//  PokemonCatalog
//
//  Created by Eduardo Jordan on 13/3/25.
//

import Foundation

enum APIError: Error {
    case failedToGetData
    case invalidURL
    case networkError
    case decodingError
    case unknownError
}

struct ErrorMessage: Identifiable {
    let id = UUID()
    let message: String
}

class ErrorHandler {
    static func handleAPIError(_ error: Error) -> ErrorMessage {
        let errorMessage: String
        
        if let apiError = error as? APIError {
            switch apiError {
            case .failedToGetData:
                errorMessage = "Error: Failed to retrieve data."
            case .invalidURL:
                errorMessage = "Error: The URL is invalid."
            case .networkError:
                errorMessage = "Error: Network connection issue."
            case .decodingError:
                errorMessage = "Error: Failed to decode the data."
            case .unknownError:
                errorMessage = "Unknown error. Please try again."
            }
        } else {
            errorMessage = error.localizedDescription
        }
        
        return ErrorMessage(message: errorMessage)
    }
}
