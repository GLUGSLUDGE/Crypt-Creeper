//
//  NetworkError.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 14/3/23.
//

import Foundation
class NetworkError {
    enum networkErrorEnum: Error{
        case invalidUrl
        case invalidResponse
        case invalidData
        case requestFailed
        case authenticationError
        case badRequest
        case outdated
        case failed
        case unknown
        case validationError(String)
        
        var customLocalizedDescription: String {
            switch self {
            case .invalidUrl:
                return "The URL is not valid"
            case .invalidResponse:
                return "The response received from the server is not valid"
            case .invalidData:
                return "The data received from the server is not valid"
            case .requestFailed:
                return "The request failed"
            case .authenticationError:
                return "There was an authentication error"
            case .badRequest:
                return "The request is not valid"
            case .outdated:
                return "The request is outdated"
            case .failed:
                return "The request failed for an unknown reason"
            case .unknown:
                return "An unknown error occurred"
            case .validationError(let messageErrors):
                return messageErrors
            }
        }
    }
}
