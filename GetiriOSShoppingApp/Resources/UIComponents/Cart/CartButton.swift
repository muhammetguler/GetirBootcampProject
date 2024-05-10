//
//  CartButton.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 19.04.2024.
//

import Foundation
import UIKit

protocol CartButtonProtocol:AnyObject {
    func setLabelPrice(_ price:String)
    func setCartButton(isHidden:Bool)
}

class CartButton: UIButton {

    private let iconImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Icon")
        return imageView
    }()
    
    private let labelContainer:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 242/255, green: 240/255, blue: 250/255, alpha: 1) // Figma: rgba(242, 240, 250, 1)
        return view
    }()
    
    private let titleLabell:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(red: 93.0/255, green: 62.0/255, blue: 188.0/255, alpha: 1)
        if let customFont = UIFont(name: "OpenSans-Bold", size: 14) {
            label.font = customFont
        }
        label.textAlignment = .center
        label.sizeToFit()
        label.text = "₺0,00"
        return label
    }()
        
    var cartPresenter:CartPresenterProtocol? {
        didSet {
            cartPresenter?.load()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButton()
        setupViews()
    }
    
    private func configureButton() {
        translatesAutoresizingMaskIntoConstraints = false

        // Background color
        backgroundColor = UIColor(white: 1, alpha: 1) // Figma: rgba(255, 255, 255, 1)

        // Border styles
        layer.borderWidth = 1
        layer.borderColor = UIColor.clear.cgColor

        // Corner radius
        layer.cornerRadius = 8
    }
    
    private func setupViews() {
        
        addSubview(self.iconImageView)
        addSubview(self.labelContainer)
        labelContainer.addSubview(titleLabell)

        titleLabell.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        labelContainer.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 34),
            iconImageView.heightAnchor.constraint(equalToConstant: 34),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconImageView.topAnchor.constraint(equalTo: topAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            labelContainer.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor,constant: 2),
            labelContainer.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -2),
            labelContainer.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            labelContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            
            titleLabell.leadingAnchor.constraint(equalTo: labelContainer.leadingAnchor, constant: 10),
            titleLabell.trailingAnchor.constraint(equalTo: labelContainer.trailingAnchor, constant: -10),
            titleLabell.topAnchor.constraint(equalTo: labelContainer.topAnchor, constant: 7),
            titleLabell.bottomAnchor.constraint(equalTo: labelContainer.bottomAnchor, constant: -7)
        ])
        
    }
}

extension CartButton:CartButtonProtocol {
    func setCartButton(isHidden: Bool) {
        self.isHidden = isHidden
    }
    
    func setLabelPrice(_ price: String) {
        self.titleLabell.text = "₺\(price)"
    }

}
