//
//  ListingViewController.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 10.04.2024.
//

import UIKit

protocol ListingViewProtocol:AnyObject {
    
    func setupHorizontalCollectionView()
    func setupVerticalCollectionView()
    func setupNavigationBar()
    func setTitle(_ text:String)
    func showLoadingView()
    func hideLoadingView()
    func showError(_ errorMessage:String)
    func reloadData()

}

class ListingViewController: BaseViewController {
    
    var presenter:ListingPresenterProtocol!
    var verticalCollectionView: UICollectionView!
    var horizontalCollectionView: UICollectionView!
    var cartButton: CartButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        presenter.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 245.0/255, green: 245.0/255, blue: 245.0/255, alpha: 1.0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.reloadData()
    }

}

extension ListingViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == verticalCollectionView {
            return presenter.numberOfItems(forCollectionType: .vertical)
        } else {
            return presenter.numberOfItems(forCollectionType: .horizontal)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let listingCell = collectionView.dequeueReusableCell(withReuseIdentifier: ListingCell.identifier, for: indexPath) as! ListingCell
        
        if collectionView == verticalCollectionView {
            if let product = presenter.product(indexPath.row, forCollectionType: .vertical) {
                listingCell.listingPresenterCell = ListingPresenterCell(view: listingCell, product: product)
            }
        } else {
            if let product = presenter.product(indexPath.row, forCollectionType: .horizontal) {
                listingCell.listingPresenterCell = ListingPresenterCell(view: listingCell, product: product)
            }
        }
                
        return listingCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == verticalCollectionView {
            presenter.didSelectRowAt(index: indexPath.row, forCollectionType: .vertical)
        } else {
            presenter.didSelectRowAt(index: indexPath.row, forCollectionType: .horizontal)
        }
                
    }
}

extension ListingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 64) / 3
        let height = width * (164.67/103.67) // constant values taken from Figma design.
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}


extension ListingViewController:ListingViewProtocol {
    
    func setupVerticalCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        verticalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        verticalCollectionView.register(ListingCell.self, forCellWithReuseIdentifier: ListingCell.identifier)
        configureCollectionView(verticalCollectionView)
    }
    
    func setupHorizontalCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        horizontalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        horizontalCollectionView.register(ListingCell.self, forCellWithReuseIdentifier: ListingCell.identifier)
        configureCollectionView(horizontalCollectionView)
    }
    
    func configureCollectionView(_ collectionView: UICollectionView) {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if collectionView == verticalCollectionView {
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: horizontalCollectionView.bottomAnchor, constant: 16),
                collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
                collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                collectionView.heightAnchor.constraint(equalToConstant: 185)
            ])
        }
    }
    
    func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 93.0/255, green: 62.0/255, blue: 188.0/255, alpha: 1.0) // rgba(93, 62, 188, 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // Apply the appearance to the navigation bar
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.isTranslucent = false
        
        // Set the title with custom font
        let titleLabel = UILabel()
        titleLabel.text = "Ürünler"
        if let customFont = UIFont(name: "OpenSans-Bold", size: 14) {
            titleLabel.font = customFont
        }
        //titleLabel.font = UIFont.boldSystemFont(ofSize: titleLabel.font.pointSize)
        titleLabel.textColor = .white
        titleLabel.sizeToFit()
        navigationItem.titleView = titleLabel

        // Add custom cart button to the right side of the navigation bar
        let cartButton = CartButton()
        let cartPresenter = CartPresenter(view: cartButton)
        cartButton.cartPresenter = cartPresenter
        cartButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)

        let cartBarButtonItem = UIBarButtonItem(customView: cartButton)
        navigationItem.rightBarButtonItem = cartBarButtonItem
    }
    
    func setTitle(_ text: String) {
        self.title = text
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
        self.horizontalCollectionView.reloadData()
    }
    
    @objc func cartButtonTapped() {
        presenter.cartButtonTapped()
    }

}
