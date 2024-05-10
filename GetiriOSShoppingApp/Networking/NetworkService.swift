//
//  NetworkService.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 10.04.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData(from url:URL, completion: @escaping (Data?, URLResponse?, Error?)->Void)
}

class NetworkService:NetworkServiceProtocol {
    
    func fetchData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                completion(data, response, error)
            }
        }.resume()
    }

}
