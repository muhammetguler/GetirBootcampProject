//
//  BasketRouter.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 24.04.2024.
//

import Foundation
import UIKit

protocol BasketRouterProtocol {
    func dismissView()
    func navigate()
}

class BasketRouter {
    
    weak var viewController: BasketViewController?
    
    static func createModule() -> UIViewController {
        
        //let networkService: NetworkServiceProtocol = NetworkService()
        //let dataManager: DataManagerProtocol = DataManager()
        
        let view = BasketViewController()
        
        let interactor = BasketInteractor()
        let router = BasketRouter()
        
        let presenter = BasketPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        let navigationController = UINavigationController(rootViewController: view)
        view.navigationBarConfigurator = NavBarConfigurator(navigationController: navigationController)

        return navigationController
    }

}

extension BasketRouter:BasketRouterProtocol {
    func navigate() {
        // MARK: Navigate to..
    }
    
    func dismissView() {
        self.viewController?.dismiss(animated: true)
    }
}
