//
//  ListingRouter.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 10.04.2024.
//

import Foundation

enum ListingRoutes { // if you have more than one option, use this.
    case detail
    case basket
}

protocol ListingRouterProtocol:AnyObject {
    func navigate(_ route: ListingRoutes, _ product:Product?)
}


class ListingRouter {
    
    weak var viewController: ListingViewController? // why do we need this?
    
    static func createModule() -> ListingViewController {
        
        let networkService: NetworkServiceProtocol = NetworkService()
        let dataManager: DataManagerProtocol = DataManager()
        
        let view = ListingViewController()
        let interactor = ListingInteractor(networkService: networkService, dataManager: dataManager)
        let router = ListingRouter()
        
        let presenter = ListingPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view // why do we need this?
        
        return view
    }

}

extension ListingRouter: ListingRouterProtocol {
    func navigate(_ route: ListingRoutes, _ product:Product? = nil) {
        switch route {
        case .detail:
            let productDetailVC = ProductDetailRouter.createModule(for: product!)
            productDetailVC.modalPresentationStyle = .fullScreen
            self.viewController?.present(productDetailVC, animated: true)
            // viewController?.navigationController?.pushViewController(productDetailVC, animated: true)
        case .basket:
            let basketVC = BasketRouter.createModule()
            basketVC.modalPresentationStyle = .fullScreen
            self.viewController?.present(basketVC, animated: true)
        }
    }
}
