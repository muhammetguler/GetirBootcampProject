//
//  NavBarConfigurator.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 23.04.2024.
//

import Foundation
import UIKit

struct NavigationBarStyle {
    var backgroundColor: UIColor = UIColor(red: 93.0/255, green: 62.0/255, blue: 188.0/255, alpha: 1.0) // default
    var titleColor: UIColor = .white // default
    var titleFont: UIFont = UIFont.boldSystemFont(ofSize: 14) // default
    var isTranslucent: Bool = false // default
}

protocol NavBarConfigurable {
    func configureNavigationBar(title: String, style: NavigationBarStyle, leftButton: UIBarButtonItem?, rightButton: UIBarButtonItem?)
}

class NavBarConfigurator {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    private func setupNavigationBarAppearance(_ style: NavigationBarStyle) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = style.backgroundColor
        appearance.titleTextAttributes = [.foregroundColor: style.titleColor, .font: style.titleFont]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.isTranslucent = style.isTranslucent
    }
}

extension NavBarConfigurator: NavBarConfigurable {
    func configureNavigationBar(title: String, style: NavigationBarStyle, leftButton: UIBarButtonItem?, rightButton: UIBarButtonItem?) {
        setupNavigationBarAppearance(style)
        
        // Configure navigation items
        if let viewController = navigationController?.topViewController {
            viewController.navigationItem.title = title
            viewController.navigationItem.leftBarButtonItem = leftButton
            viewController.navigationItem.rightBarButtonItem = rightButton
        }

        // Set the navigation items to the navigation bar
        //navigationController?.navigationBar.setItems([navigationItem], animated: false)
    }
}
