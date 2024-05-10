//
//  ProductDetailPresenter.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 22.04.2024.
//

import Foundation
import UIKit

protocol ProductDetailPresenterProtocol {
    func viewDidLoad()
    func closeButtonTapped()
    func cartButtonTapped()
    func addToCartButtonTapped()
}

class ProductDetailPresenter {
    
    var product: Product
    unowned var view:ProductDetailViewControllerProtocol
    var interactor:ProductDetailInteractorProtocol
    var router:ProductDetailRouterProtocol
    
    init(product: Product, view: ProductDetailViewController, interactor: ProductDetailInteractorProtocol, router: ProductDetailRouterProtocol) {
        self.product = product
        self.view = view
        self.interactor = interactor
        self.router = router
    }

}

extension ProductDetailPresenter:ProductDetailPresenterProtocol {
    func viewDidLoad() {
        
        let style = NavigationBarStyle(
            backgroundColor: UIColor(red: 93.0/255, green: 62.0/255, blue: 188.0/255, alpha: 1.0), // Example custom color
            titleColor: .white, // Example custom title color
            titleFont: UIFont(name: "OpenSans-Bold", size: 14) ?? UIFont.systemFont(ofSize: 14), // Example custom font
            isTranslucent: true // Example custom translucency
        )
                
        view.setNavigationBar(with: "Ürün Detayi", style: style)
        view.setImageView(UIImage(data: product.imageData ?? Data()) ?? UIImage())
        view.setNameLabel(product.name)
        view.setPriceLabel(product.price.toPriceRoundedString())
        view.setAttributeLabel(product.attribute ?? product.shortDescription ?? "")
        view.setupStepperView(product)
    }

    func closeButtonTapped() {
        router.dismissView()
    }
    
    func cartButtonTapped() {
        router.navigate()
    }
    
    func addToCartButtonTapped() {
        BasketManager.shared.addProduct(product)
        view.setupStepperView(product)
        view.setCartButton(true)
    }

}

extension ProductDetailPresenter:StepperPresenterDelegate {
    func didProductCountNotZero() {
        view.setCartButton(true)
    }
    
    func didProductCountZero() {
        view.setCartButton(false)
    }

}

extension ProductDetailPresenter:ProductDetailInteractorOutputProtocol {
    
}
