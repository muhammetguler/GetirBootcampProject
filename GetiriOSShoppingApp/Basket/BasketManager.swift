//
//  BasketManager.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 22.04.2024.
//

import Foundation

//protocol BasketManagerProtocol:AnyObject {
//    func didAddProductToBasket(_ product: Product)
//    func didRemoveProductFromBasket(_ product: Product)
//    func didUpdateTotalPrice(_ price: Double)
//    func updateVisibility(isHidden:Bool)
//}

class BasketManager {
    static let shared = BasketManager()
    private var products: [Product] = []
//    weak var delegate:BasketManagerProtocol?
    
    private var totalPrice:Double = 0 {
        didSet {
//            self.delegate?.didUpdateTotalPrice(totalPrice)
//            self.delegate?.updateVisibility(isHidden:totalPrice<=0)
            NotificationCenter.default.post(name: .didUpdateTotalPrice, object: nil, userInfo: ["totalPrice": totalPrice])
            NotificationCenter.default.post(name: .updateVisibility, object: nil, userInfo: ["isHidden": totalPrice <= 0])
        }
    }
    
    private init() {}
    
    func addProduct(_ product: Product) {
        // Implement logic to add product to the basket
        products.append(product)
        calculateTotalPrice()
        
    }
    
    func removeProduct(_ product: Product) {
        // Implement logic to remove product from the basket
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products.remove(at: index)
        }
        calculateTotalPrice()
    }
    
    func calculateTotalPrice() {
        totalPrice = products.reduce(0) { $0 + $1.price }
    }
    
    func getTotalPrice() -> Double {
        return totalPrice
    }
    
    func getUniqueProducts() -> [Product] { // unique products
        var uniqueProducts: [Product] = []
        var seenIDs: Set<String> = []

        for product in products {
            if !seenIDs.contains(product.id) {
                uniqueProducts.append(product)
                seenIDs.insert(product.id)
            }
        }
        
        return uniqueProducts
    }
    
    func getUniqueProductCount() -> Int {
        return getUniqueProducts().count
    }
    
    func getNumberOfProducts() -> Int {
        return products.count
    }
    
    func findItemCount(with ID:String) -> Int {
        return products.filter { $0.id == ID }.count
    }
    
    func removeAllProducts() {
        products.removeAll()
        calculateTotalPrice()
    }

}
