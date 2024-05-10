//
//  BasketPresenterCell.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 24.04.2024.
//

import Foundation
import UIKit

protocol BasketPresenterCellProtocol:AnyObject {
    func load()
}

final class BasketPresenterCell {
    weak var view: BasketCellProtocol?
    private let product: Product
    
    init(view: BasketCellProtocol,
         product: Product) {
        self.view = view
        self.product = product
    }
}

extension BasketPresenterCell:BasketPresenterCellProtocol {
    func load() {
        self.view?.setViews(product)
    }
    
    
}

extension BasketPresenterCell:StepperPresenterDelegate {
    func didProductCountZero() {
        //self.view?.setLayerColor(color: UIColor(red: 242.0/255, green: 240.0/255, blue: 250.0/255, alpha: 1.0))
    }
    
    func didProductCountNotZero() {
        //self.view?.setLayerColor(color: UIColor(red: 93/255, green: 62/255, blue: 188/255, alpha: 1))
    }
    
    
}
