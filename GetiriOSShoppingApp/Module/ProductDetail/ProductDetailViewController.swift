//
//  ProductDetailViewController.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 22.04.2024.
//

import Foundation
import UIKit

enum ShadowPosition {
    case top
    case bottom
}

protocol ProductDetailViewControllerProtocol:AnyObject {
    func setNavigationBar(with title:String, style:NavigationBarStyle)
    func setImageView(_ image:UIImage)
    func setPriceLabel(_ price:String)
    func setNameLabel(_ name:String)
    func setAttributeLabel(_ attribute:String)
    func setupStepperView(_ product:Product)
    func setCartButton(_ isHidden:Bool)
}

class ProductDetailViewController:BaseViewController {
    
    var presenter:ProductDetailPresenterProtocol!
    var navigationBarConfigurator: NavBarConfigurable?
    var stepperView:StepperView?
    
    private let labelView = UIView()
    private let containerView = UIView()
    private let topContainerView = UIView()
    private let bottomContainerView = UIView()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Bold", size: 20)
        label.textColor = UIColor(red: 93/255, green: 62/255, blue: 188/255, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        if let customFont = UIFont(name: "OpenSans-Semibold", size: 16) {
            label.font = customFont
        }
        label.textColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let attributeLabel: UILabel = {
        let label = UILabel()
        if let customFont = UIFont(name: "OpenSans-Semibold", size: 12) {
            label.font = customFont
        }
        label.textColor = UIColor(red: 105/255, green: 116/255, blue: 136/255, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sepete Ekle", for: .normal)
        button.backgroundColor = UIColor(red: 93/255, green: 62/255, blue: 188/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 14)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setupViews()
        presenter.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        addShadow(to: topContainerView, at: .bottom, offset: CGSize(width: 0, height: 1))
        addShadow(to: bottomContainerView, at: .top, color: UIColor(red: 105/255, green: 116/255, blue: 136/255, alpha: 1), opacity: 0.12, radius: 2.0, offset: CGSize(width: 0, height: -4))

    }
    
    private func addShadow(to view: UIView, at position: ShadowPosition, color: UIColor = .black, opacity: Float = 0.1, radius: CGFloat = 1.0, offset: CGSize) {
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOpacity = opacity
        view.layer.shadowRadius = radius
        view.layer.masksToBounds = false

        // Adjusting shadow offset based on position
        switch position {
        case .top:
            view.layer.shadowOffset = offset
            addShadowPathToTop(of: view, depth: offset.height)
        case .bottom:
            view.layer.shadowOffset = offset
            addShadowPathToBottom(of: view, depth: offset.height)
        }
    }

    private func addShadowPathToTop(of view: UIView, depth: CGFloat) {
        let shadowPath = UIBezierPath()
        shadowPath.move(to: CGPoint(x: 0, y: 0 - depth))
        shadowPath.addLine(to: CGPoint(x: view.bounds.width, y: 0 - depth))
        shadowPath.addLine(to: CGPoint(x: view.bounds.width, y: 0))
        shadowPath.addLine(to: CGPoint(x: 0, y: 0))
        shadowPath.close()
        view.layer.shadowPath = shadowPath.cgPath
    }

    private func addShadowPathToBottom(of view: UIView, depth: CGFloat) {
        let shadowPath = UIBezierPath()
        shadowPath.move(to: CGPoint(x: 0, y: view.bounds.height))
        shadowPath.addLine(to: CGPoint(x: view.bounds.width, y: view.bounds.height))
        shadowPath.addLine(to: CGPoint(x: view.bounds.width, y: view.bounds.height + depth))
        shadowPath.addLine(to: CGPoint(x: 0, y: view.bounds.height + depth))
        shadowPath.close()
        view.layer.shadowPath = shadowPath.cgPath
    }
    
    private func setupViews() {
        // Container Views
        labelView.addSubview(priceLabel)
        labelView.addSubview(nameLabel)
        labelView.addSubview(attributeLabel)
        
        containerView.addSubview(labelView)
        
        topContainerView.addSubview(imageView)
        topContainerView.addSubview(containerView)
        
        bottomContainerView.addSubview(addToCartButton)

        // Add subviews
        view.addSubview(topContainerView)
        view.addSubview(bottomContainerView)
        
        // Add target to addToCartButton
        addToCartButton.addTarget(self, action: #selector(addToCartButtonTapped), for: .touchUpInside)
        
        labelView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup the constraints
        NSLayoutConstraint.activate([
            topContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            topContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            // ImageView
            imageView.topAnchor.constraint(equalTo: topContainerView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),

            // Container View for Labels
            containerView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor),

            // Label View
            labelView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            labelView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            labelView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),

            // Price Label
            priceLabel.topAnchor.constraint(equalTo: labelView.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: labelView.trailingAnchor),

            // Name Label
            nameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: labelView.trailingAnchor),

            // Attribute Label
            attributeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            attributeLabel.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
            attributeLabel.trailingAnchor.constraint(equalTo: labelView.trailingAnchor),

            // Now set the bottom of containerView which will also set the height for topContainerView indirectly
            containerView.bottomAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 16),

            // Now set the bottom of topContainerView to the bottom of containerView
            topContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

            // Same..
            labelView.bottomAnchor.constraint(equalTo: attributeLabel.bottomAnchor),
            
            // Bottom Container View
            //bottomContainerView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor),
            bottomContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            // Add to Cart Button
            addToCartButton.heightAnchor.constraint(equalToConstant: 50),
            addToCartButton.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 16),
            addToCartButton.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: -16),
            addToCartButton.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor, constant: -16),

            bottomContainerView.topAnchor.constraint(equalTo: addToCartButton.topAnchor, constant: -16)
            
        ])
        
    }
    
    

}

extension ProductDetailViewController:ProductDetailViewControllerProtocol {
    func setupStepperView(_ product: Product) {
        self.stepperView = StepperView(isVertical: false)
        let stepperPresent = StepperPresenter(view: self.stepperView!, product: product)
        stepperPresent.delegate = self.presenter as! ProductDetailPresenter
        stepperView!.stepperPresenter = stepperPresent
        
        
        self.view.addSubview(stepperView!)
        stepperView?.translatesAutoresizingMaskIntoConstraints = false
            
        if let stepperView = self.stepperView {
            NSLayoutConstraint.activate([
                stepperView.centerXAnchor.constraint(equalTo: self.bottomContainerView.centerXAnchor),
                stepperView.centerYAnchor.constraint(equalTo: self.bottomContainerView.centerYAnchor),
//                bottomContainerView.topAnchor.constraint(equalTo: stepperView.topAnchor, constant: -16)

            ])
        }

    }
    
    func setCartButton(_ isHidden: Bool) {
        self.addToCartButton.isHidden = isHidden
        self.stepperView!.isHidden = !isHidden
    }
    
    func setImageView(_ image: UIImage) {
        self.imageView.image = image
    }
    
    func setPriceLabel(_ price: String) {
        self.priceLabel.text = "₺\(price)"
    }
    
    func setNameLabel(_ name: String) {
        self.nameLabel.text = name
    }
    
    func setAttributeLabel(_ attribute: String) {
        self.attributeLabel.text = attribute
    }
    
    func setNavigationBar(with title:String, style:NavigationBarStyle) {
        
        let cartButton = CartButton()
        let cartPresenter = CartPresenter(view: cartButton)
        cartButton.cartPresenter = cartPresenter
        cartButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)

        let cartBarButtonItem = UIBarButtonItem(customView: cartButton)
                
        let closeImage = UIImage(named: "close")?.withRenderingMode(.alwaysOriginal)
        let closeButtonItem = UIBarButtonItem(image: closeImage, style: .plain, target: self, action: #selector(closeButtonTapped))
        
        navigationBarConfigurator?.configureNavigationBar(title: title, style: style, leftButton: closeButtonItem, rightButton: cartBarButtonItem)
    }
    
    @objc func closeButtonTapped() {
        presenter.closeButtonTapped()
    }
    
    @objc func cartButtonTapped() {
        presenter.cartButtonTapped()
    }
    
    @objc func addToCartButtonTapped() {
        presenter.addToCartButtonTapped()
    }
    
    
}
