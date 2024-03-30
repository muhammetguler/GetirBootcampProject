//
//  TabBarController.swift
//  GetirBasicComponents
//
//  Created by Muhammet Guler on 24.03.2024.
//

import UIKit

class TabBarController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let tabbar = tabBarController?.tabBar else { return }
        tabbar.backgroundColor = .blue
        tabbar.tintColor = .yellow
        tabbar.unselectedItemTintColor = .red
        
        tabbar.layer.cornerRadius = 30
        tabbar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabbar.layer.masksToBounds = true
        
        tabbar.layer.borderWidth = 2
        tabbar.layer.borderColor = UIColor.black.cgColor

    }
    


}
