//
//  LoadingShowable.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 10.04.2024.
//

import Foundation
import UIKit

protocol LoadingShowable where Self: UIViewController {
    func showLoading()
    func hideLoading()
}

extension LoadingShowable {
    func showLoading() {
        LoadingView.shared.startLoading()
    }
    
    func hideLoading() {
        LoadingView.shared.hideLoading()
    }
}

// This protocol LoadingShowable is defined with a where clause, which adds a constraint that any UIViewController subclass that wants to conform to LoadingShowable must fulfill the requirements defined in the protocol. This means that LoadingShowable can only be adopted by UIViewController subclasses, not by other types like structs or classes that do not inherit from UIViewController.
