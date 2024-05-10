//
//  Notification.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 23.04.2024.
//

import Foundation

extension Notification.Name {
    static let didAddProductToBasket = Notification.Name("didAddProductToBasketNotification")
    static let didRemoveProductFromBasket = Notification.Name("didRemoveProductFromBasketNotification")
    static let didUpdateTotalPrice = Notification.Name("didUpdateTotalPriceNotification")
    static let updateVisibility = Notification.Name("updateVisibilityNotification")
    static let didRemoveAllProducts = Notification.Name("didRemoveAllProductsNotification")
    
}

