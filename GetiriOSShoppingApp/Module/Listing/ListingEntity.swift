//
//  ListingEntity.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 10.04.2024.
//

import Foundation

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let id: String
    let name: String?
    let productCount: Int?
    let products: [Product]?
    let email, password: String?
}

// MARK: - Product
struct Product: Codable {
    let id, name: String
    let attribute: String?
    let thumbnailURL, imageURL: String?
    let price: Double
    let priceText: String
    let shortDescription: String?
    var imageData: Data? // added.

}

typealias Welcome = [WelcomeElement]
