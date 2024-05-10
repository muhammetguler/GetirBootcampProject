//
//  ListingPresenter.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 10.04.2024.
//

import Foundation

protocol ListingPresenterProtocol {
    func viewDidLoad()
    func numberOfItems(forCollectionType collectionType: CollectionType) -> Int
    func product(_ index:Int, forCollectionType collectionType: CollectionType) -> Product? // to get the product with index specified to show on CollectionView.
    func didSelectRowAt(index:Int, forCollectionType collectionType: CollectionType)
    func cartButtonTapped()

}

class ListingPresenter {
    private var verticalProducts = [Product]()
    private var horizontalProducts = [Product]()


    unowned var view:ListingViewProtocol!
    let interactor:ListingInteractorInputProtocol!
    let router:ListingRouterProtocol!
    ///MARK: write for router

    init(view: ListingViewProtocol, interactor: ListingInteractorInputProtocol, router: ListingRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

}

extension ListingPresenter:ListingPresenterProtocol {
    func numberOfItems(forCollectionType collectionType: CollectionType) -> Int {
        switch collectionType {
        case .horizontal:
            return self.horizontalProducts.count
        case .vertical:
            return self.verticalProducts.count
        }
    }
    
    func cartButtonTapped() {
        router.navigate(.basket, nil)
    }
    
    func product(_ index: Int, forCollectionType collectionType: CollectionType) -> Product? {
        switch collectionType {
        case .horizontal:
            return self.horizontalProducts[safe: index]
        case .vertical:
            return self.verticalProducts[safe: index]
        }
    }
    
    func didSelectRowAt(index: Int, forCollectionType collectionType: CollectionType) {
        if let product = product(index, forCollectionType: collectionType) {
            router.navigate(.detail, product)
        }
    }
    
    func viewDidLoad() {
        view.setupNavigationBar()
        view.setTitle("Urunler")
        
        view.setupHorizontalCollectionView()
        view.setupVerticalCollectionView()
        
        view.showLoadingView()
        
        interactor.retrieveProducts(endpoint: .products, forCollectionType: .vertical)
        view.showLoadingView()
        interactor.retrieveProducts(endpoint: .suggestedProducts, forCollectionType: .horizontal)
        

    }
}

extension ListingPresenter:ListingInteractorOutputProtocol {
    func didFailWithError(_ error: Error) {
        if let error = error as? APIError {
            view.showError(error.errorDescription)
        } else {
            view.showError("An unexpected error occurred.")
        }
    }
    
    
    func didRetrieveProducts(_ products: [Product]?, forCollectionType collectionType: CollectionType) {
        view.hideLoadingView()
        
        guard let products = products else { return }
        
        switch collectionType {
        case .vertical:
            self.verticalProducts = products
        case .horizontal:
            self.horizontalProducts = products
        }
        
        view.reloadData()
    }
    

}



