//
//  OrderViewPresenter.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 25.04.2024.
//

import Foundation
import UIKit
 
protocol OrderViewPresenterProtocol {
    func load()
}

class OrderViewPresenter {
    
    weak var view:OrderViewProtocol?
    
    init(view:OrderViewProtocol) {
        self.view = view
    }
    
}

extension OrderViewPresenter:OrderViewPresenterProtocol {
    
    func load() {
//        NotificationCenter.default.addObserver(self, selector: #selector(handleProductsRemoved(_:)), name: .didRemoveAllProducts, object: nil)
//        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTotalPriceUpdated(_:)), name: .didUpdateTotalPrice, object: nil)
        
        let price = BasketManager.shared.getTotalPrice()
        self.view?.setLabelPrice(price.toPriceRoundedString())
    }
    
//    @objc func handleProductsRemoved(_ notification: Notification) {
//         if let totalPrice = notification.userInfo?["totalPrice"] as? Double {
//             self.view?.setLabelPrice(totalPrice.toPriceRoundedString())
//         }
//     }
//    
    @objc func handleTotalPriceUpdated(_ notification: Notification) {
         if let totalPrice = notification.userInfo?["totalPrice"] as? Double {
             self.view?.setLabelPrice(totalPrice.toPriceRoundedString())
         }
     }
    
}

