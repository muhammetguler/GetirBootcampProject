//
//  Enum.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 10.04.2024.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidUrl
    case requestFailed(description: String)
    case networkUnavailable // use SCNetworkReachability or a third-party library to check it
    case noData
    case dataDecodingFailed(description: String)
    case serverError(statusCode: Int)
    case unauthorized
    case forbidden
    case notFound
    case unknown
    
    var errorDescription: String {
        switch self {
        case .invalidUrl:
            return "The provided URL is invalid."
        case .requestFailed(let description):
            return "The request failed: \(description)"
        case .networkUnavailable:
            return "The network is currently unavailable."
        case .noData:
            return "No data was received from the server."
        case .dataDecodingFailed(let description):
            return "Failed to decode the data: \(description)"
        case .serverError(let statusCode):
            return "Server error with status code: \(statusCode)"
        case .unauthorized:
            return "Unauthorized access. Please login again."
        case .forbidden:
            return "Forbidden access. You do not have the necessary permissions."
        case .notFound:
            return "The requested resource was not found."
        case .unknown:
            return "An unknown error occurred."
        }
    }
}

extension APIError {
    static func error(from statusCode: Int) -> APIError {
        switch statusCode {
        case 401:
            return .unauthorized
        case 403:
            return .forbidden
        case 404:
            return .notFound
        case 500...599:
            return .serverError(statusCode: statusCode)
        default:
            return .unknown
        }
    }
}


