//
//  StepperPresenter.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 22.04.2024.
//

import Foundation
import UIKit
 
protocol StepperPresenterProtocol {
    func plusButtonTapped()
    func trashButtonTapped()
    func updateVisibility()
    func load()
}

protocol StepperPresenterDelegate:AnyObject {
    func didProductCountZero()
    func didProductCountNotZero()
}

class StepperPresenter {
    
    private var itemCount: Int = 0 {
        didSet {
            updateVisibility()
        }
    }
    
    weak var view:StepperViewProtocol?
    var product:Product
    weak var delegate:StepperPresenterDelegate?
    
    init(view:StepperViewProtocol, product:Product) {
        self.view = view
        self.product = product
    }
    
}

extension StepperPresenter:StepperPresenterProtocol {
    
    func load() {
        self.itemCount = BasketManager.shared.findItemCount(with: product.id)
//        if itemCount > 0 {
//            self.delegate?.didProductCountNotZero()
//        }
        //self.itemCount = product.numberAdded
    }
    
    func updateVisibility() {
        let isHidden = itemCount <= 0
        view?.setTrashButton(hidden: isHidden)
        view?.setItemCountLabel(hidden: isHidden)
        view?.setItemCountLabel(itemCount)
        
        if itemCount <= 0 {
            self.delegate?.didProductCountZero()
        } else {
            self.delegate?.didProductCountNotZero()
        }
        
        let color: UIColor = itemCount > 0 ? .white : .clear
        view?.setBackgroundColor(color)
        
        var iconImage:UIImage = itemCount > 1 ? UIImage(named: "minus") ?? UIImage() : UIImage(named: "trash") ?? UIImage()
        iconImage = iconImage.withRenderingMode(.alwaysTemplate)
        view?.setIcons(image: iconImage)
    }
    
    func plusButtonTapped() {
        itemCount += 1
        BasketManager.shared.addProduct(product)
        // You can call this function from Interactor may be.
    }
    
    
    func trashButtonTapped() {
        itemCount = max(0, itemCount - 1)
        BasketManager.shared.removeProduct(product)
        // You can call this function from Interactor may be.
    }
}

