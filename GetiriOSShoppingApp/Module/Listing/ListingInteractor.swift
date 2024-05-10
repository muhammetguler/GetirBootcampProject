//
//  ListingInteractor.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 10.04.2024.
//

import Foundation

protocol ListingInteractorInputProtocol:AnyObject {
    func retrieveProducts(endpoint: APIEndpoint, forCollectionType collectionType: CollectionType)
    func fetchImagesForProducts(_ products: [Product], forCollectionType collectionType: CollectionType, completion: @escaping ([Product]) -> Void)
}

protocol ListingInteractorOutputProtocol:AnyObject { // a protocol that ListingPresenter need to comply with
    func didRetrieveProducts(_ products:[Product]?, forCollectionType collectionType: CollectionType)
    func didFailWithError(_ error:Error)
}

enum CollectionType {
    case vertical
    case horizontal
}

final class ListingInteractor {
    
    weak var presenter:ListingInteractorOutputProtocol?
    private let networkService:NetworkServiceProtocol
    private let dataManager:DataManagerProtocol
    
    init(networkService: NetworkServiceProtocol, dataManager: DataManagerProtocol) {
        self.networkService = networkService
        self.dataManager = dataManager
    }

}

extension ListingInteractor:ListingInteractorInputProtocol {
    func fetchImagesForProducts(_ products: [Product], forCollectionType collectionType: CollectionType, completion: @escaping ([Product]) -> Void) {
        
        let group = DispatchGroup()

        var updatedProducts = products

        for (index, product) in products.enumerated() {            
            if let imageURL = product.imageURL {
                guard let imageUrl = URL(string: imageURL) else {
                    self.presenter?.didFailWithError(APIError.invalidUrl)
                    return
                }
                
                group.enter()
                networkService.fetchData(from: imageUrl) { data, response, error in
                    defer { group.leave() }
                    guard let data = data, error == nil else {
                        print("Failed to fetch image for product: \(product.name)")
                        // MARK: Handle each error, may be you can create a module for the errors.
                        return
                    }
                    updatedProducts[index].imageData = data
                }
            }
        }

        group.notify(queue: .main) {
            self.presenter?.didRetrieveProducts(updatedProducts, forCollectionType: collectionType)
        }
    }
    
    func retrieveProducts(endpoint: APIEndpoint, forCollectionType collectionType: CollectionType) {
        
        guard let url = URL(string: "\(endpoint.urlString)") else {
            self.presenter?.didFailWithError(APIError.invalidUrl)
            return
        }
        
        self.networkService.fetchData(from: url) { data, response, error in
            if let error = error {
                self.presenter?.didFailWithError(APIError.requestFailed(description: error.localizedDescription))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                self.presenter?.didFailWithError(APIError.unknown)
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else { // in most restful services, successful response is between 200 and 299
                self.presenter?.didFailWithError(APIError.error(from: httpResponse.statusCode))
                return
            }
            
            guard let data = data else {
                self.presenter?.didFailWithError(APIError.noData)
                return
            }
            
            do {
                let welcomeElements = try self.dataManager.decodeProducts(type: Welcome.self, from: data)
                let products = welcomeElements.compactMap {$0.products}.flatMap { $0 }
                // compactMap unwraps the optional products arrays, filtering out any nil values, and then flatMap is used to flatten the arrays of Product.
                //let products = welcomeElements.flatMap{$0.products}
                //self.presenter?.didRetrieveProducts(products)
                self.fetchImagesForProducts(products, forCollectionType: collectionType) { updatedProducts in
                    self.presenter?.didRetrieveProducts(updatedProducts, forCollectionType: collectionType)
                }
            } catch {
                self.presenter?.didFailWithError(APIError.dataDecodingFailed(description: error.localizedDescription))
            }

        }

    }
    
    
}


