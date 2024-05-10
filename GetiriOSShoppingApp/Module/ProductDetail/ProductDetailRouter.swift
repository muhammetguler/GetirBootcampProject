//
//  ProductDetailRouter.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 22.04.2024.
//

import Foundation
import UIKit

protocol ProductDetailRouterProtocol {
    func dismissView()
    func navigate()
}

class ProductDetailRouter {
    
    weak var viewController: ProductDetailViewController?
    
    static func createModule(for product:Product) -> UIViewController {
        
        //let networkService: NetworkServiceProtocol = NetworkService()
        //let dataManager: DataManagerProtocol = DataManager()
        
        let view = ProductDetailViewController()
        
        let interactor = ProductDetailInteractor()
        let router = ProductDetailRouter()
        
        let presenter = ProductDetailPresenter(product: product, view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        let navigationController = UINavigationController(rootViewController: view)
        view.navigationBarConfigurator = NavBarConfigurator(navigationController: navigationController)

        return navigationController
    }

}

extension ProductDetailRouter:ProductDetailRouterProtocol {
    func navigate() {
        let basketVC = BasketRouter.createModule()
        basketVC.modalPresentationStyle = .fullScreen
        self.viewController?.present(basketVC, animated: true)
    }
    
    func dismissView() {
        self.viewController?.dismiss(animated: true)
    }
}
