//
//  PostCellPresenter.swift
//  Week-4-VIPER
//
//  Created by Kerim Çağlar on 6.04.2024.
//

import Foundation
import UIKit

protocol ListingPresenterCellProtocol: AnyObject {
    func load()
}

final class ListingPresenterCell {
    weak var view: ListingCell?
    private let product: Product
    
    init(view: ListingCell,
         product: Product) {
        self.view = view
        self.product = product
    }
}

extension ListingPresenterCell: ListingPresenterCellProtocol {
    
    func load() { // trigger this function whenever you initialize ListingPresenterCell in ListingCell
        
        self.view?.setViews(product)
    }
    
    
    // MARK: retrieve images, then load..
    
}

extension ListingPresenterCell:StepperPresenterDelegate {
    func didProductCountZero() {
        self.view?.setLayerColor(color: UIColor(red: 242.0/255, green: 240.0/255, blue: 250.0/255, alpha: 1.0))
    }
    
    func didProductCountNotZero() {
        self.view?.setLayerColor(color: UIColor(red: 93/255, green: 62/255, blue: 188/255, alpha: 1))
    }
    
    
}
