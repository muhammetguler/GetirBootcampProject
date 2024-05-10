//
//  APIEndpoint.swift
//  GetiriOSShoppingApp
//
//  Created by MUHAMMET TAYYİB GÜLER on 3.05.2024.
//

import Foundation

enum APIEndpoint {
    case products
    case suggestedProducts
    
    var urlString: String {
        switch self {
        case .products:
            return "https://65c38b5339055e7482c12050.mockapi.io/api/products"
        case .suggestedProducts:
            return "https://65c38b5339055e7482c12050.mockapi.io/api/suggestedProducts"
        }
    }
}

