//
//  CartPresenter.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 22.04.2024.
//

import Foundation

protocol CartPresenterProtocol {
    func load()
}

class CartPresenter {
    weak var view:CartButtonProtocol?
    
    init(view:CartButton) {
        self.view = view
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension CartPresenter:CartPresenterProtocol {
    func load() {
//        BasketManager.shared.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTotalPriceUpdated(_:)), name: .didUpdateTotalPrice, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleVisibilityUpdate(_:)), name: .updateVisibility, object: nil)

        
        let price = BasketManager.shared.getTotalPrice()
        self.view?.setLabelPrice(price.toPriceRoundedString())
        
        let productCount = BasketManager.shared.getNumberOfProducts()
        self.view?.setCartButton(isHidden:productCount<=0)
    }
    
    @objc func handleTotalPriceUpdated(_ notification: Notification) {
         if let totalPrice = notification.userInfo?["totalPrice"] as? Double {
             self.view?.setLabelPrice(totalPrice.toPriceRoundedString())
         }
     }
     
     @objc func handleVisibilityUpdate(_ notification: Notification) {
         if let isHidden = notification.userInfo?["isHidden"] as? Bool {
             self.view?.setCartButton(isHidden:isHidden)
         }
     }
    


}



//extension CartPresenter:BasketManagerProtocol {
//    func didAddProductToBasket(_ product: Product) {
//        //
//    }
//    
//    func didRemoveProductFromBasket(_ product: Product) {
//        //
//    }
//    
//    func didUpdateTotalPrice(_ price: Double) {
//        self.view?.setLabelPrice(convertPriceRoundedString(price))
//    }
//    
//    func updateVisibility(isHidden: Bool) {
//        self.view?.setCartButton(isHidden:isHidden)
//    }
//    
//}
