//
//  BasketPresenter.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 24.04.2024.
//
import Foundation
import UIKit

protocol BasketPresenterProtocol {
    func viewDidLoad()
    func numberOfItems() -> Int
    func closeButtonTapped()
    func trashButtonTapped()
    func getProductsInBasket()
    func product(_ index:Int) -> Product? // to get the product with index specified to show on CollectionView.
}

class BasketPresenter {
    private var products = [Product]()
    
    unowned var view:BasketViewControllerProtocol!
    let interactor:BasketInteractorProtocol!
    let router:BasketRouterProtocol!
    ///MARK: write for router

    init(view: BasketViewControllerProtocol, interactor: BasketInteractorProtocol, router: BasketRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

}

extension BasketPresenter:BasketPresenterProtocol {
    func product(_ index: Int) -> Product? {
        return self.products[safe: index]
    }
    
    func getProductsInBasket() {
        self.products = BasketManager.shared.getUniqueProducts()
    }
    
    func closeButtonTapped() {
        router.dismissView()
    }
    
    func trashButtonTapped() {
        BasketManager.shared.removeAllProducts()
        self.products = []
        view.reloadData()
        // MARK: Show alert
    }
    
    func numberOfItems() -> Int {
        return BasketManager.shared.getUniqueProductCount()
    }
    
    func viewDidLoad() {
        let style = NavigationBarStyle(
            backgroundColor: UIColor(red: 93.0/255, green: 62.0/255, blue: 188.0/255, alpha: 1.0), // Example custom color
            titleColor: .white, // Example custom title color
            titleFont: UIFont(name: "OpenSans-Bold", size: 14) ?? UIFont.systemFont(ofSize: 14), // Example custom font
            isTranslucent: true // Example custom translucency
        )
                
        view.setNavigationBar(with: "Sepetim", style: style)
        view.setupVerticalCollectionView()
        view.setupOrderView()

        self.getProductsInBasket()

    }
}


