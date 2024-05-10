//
//  DataManager.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 10.04.2024.
//

import Foundation

protocol DataManagerProtocol {
    func decodeProducts<T:Codable>(type: T.Type, from data:Data) throws -> T
    //func decodeProducts(from data:Data) throws -> [Product]
}

class DataManager:DataManagerProtocol {
    func decodeProducts<T>(type: T.Type, from data: Data) throws -> T where T : Decodable, T : Encodable {
        return try JSONDecoder().decode(T.self, from: data)
    }
    /*
    func decodeProducts(from data: Data) throws -> [Product] {
        let welcomeElements = try JSONDecoder().decode(Welcome.self, from: data)
        return welcomeElements.flatMap{$0.products}
    }
    */
}

// [[W]] -> [[String:Any]] -> [["id": ,"name": ,"productCount": ,"products":[Products]]]
// 1.Transforms each element in the collection: [[Products]] -> [[P1,P2,P3..]]
// 2.Flattens the result into a single, one-dimensional array. [Products] -> [P1,P2,P3..]




