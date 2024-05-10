//
//  ProductDetailViewController.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 22.04.2024.
//

import Foundation
import UIKit

protocol BasketViewControllerProtocol:AnyObject {
    func setNavigationBar(with title:String, style:NavigationBarStyle)
    func setupVerticalCollectionView()
    func setupOrderView()
    func showLoadingView()
    func hideLoadingView()
    func showError(_ errorMessage:String)
    func reloadData()
}

class BasketViewController:BaseViewController {
    
    var presenter:BasketPresenterProtocol!
    var navigationBarConfigurator: NavBarConfigurable?
    var verticalCollectionView: UICollectionView!
    
    var orderView = OrderView()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        presenter.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.reloadData()
    }
    
    private func configureCollectionView(_ collectionView: UICollectionView){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureOrderView() {
        orderView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(orderView)
        
        NSLayoutConstraint.activate([
            orderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            orderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            orderView.heightAnchor.constraint(equalToConstant: 50),
            orderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
        
    }

}

extension BasketViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let basketCell = collectionView.dequeueReusableCell(withReuseIdentifier: BasketCell.identifier, for: indexPath) as! BasketCell
        
        if let product = presenter.product(indexPath.row) {
            basketCell.basketPresenterCell = BasketPresenterCell(view: basketCell, product: product)
        }
                
        return basketCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // MARK: after clicking on each item..
    }
}

extension BasketViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 32)
        let height = width * (74/343) // constant values taken from Figma design.
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    }
}

extension BasketViewController:BasketViewControllerProtocol {
    
    func setupVerticalCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        verticalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        verticalCollectionView.register(BasketCell.self, forCellWithReuseIdentifier: BasketCell.identifier)
        configureCollectionView(verticalCollectionView)
    }
    
    func setupOrderView() {
        var orderPresenter = OrderViewPresenter(view: self.orderView)
        self.orderView.orderPresenter = orderPresenter
        configureOrderView()
    }
    
    func showLoadingView() {
        self.showLoading()
    }
    
    func hideLoadingView() {
        self.hideLoading()
    }
    
    func showError(_ errorMessage: String) {
        self.showAlert(title: "Error", message: errorMessage)
    }
    
    func reloadData() {
        self.verticalCollectionView.reloadData()
    }
    
    func setNavigationBar(with title:String, style:NavigationBarStyle) {

        let closeImage = UIImage(named: "close")?.withRenderingMode(.alwaysOriginal)
        let closeButtonItem = UIBarButtonItem(image: closeImage, style: .plain, target: self, action: #selector(closeButtonTapped))
        
        let trashImage = UIImage(named: "trashBasket")?.withRenderingMode(.alwaysOriginal)
        let trashButtonItem = UIBarButtonItem(image: trashImage, style: .plain, target: self, action: #selector(trashButtonTapped))
        
        navigationBarConfigurator?.configureNavigationBar(title: title, style: style, leftButton: closeButtonItem, rightButton: trashButtonItem)
    
    }
    
    @objc func closeButtonTapped() {
        presenter.closeButtonTapped()
    }
    
    @objc func trashButtonTapped() {
        presenter.trashButtonTapped()
    }
    
    
}
