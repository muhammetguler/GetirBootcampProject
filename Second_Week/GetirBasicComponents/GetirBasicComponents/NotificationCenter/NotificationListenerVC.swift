//
//  NotificationListenerVC.swift
//  GetirBasicComponents
//
//  Created by Muhammet Guler on 23.03.2024.
//

import UIKit

class NotificationListenerVC: UIViewController {

    @IBOutlet weak var messageImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationCenter:NotificationCenter = .default
        notificationCenter.addObserver(self, selector: #selector(changeImage), name: .sendDataNotification, object: nil)
        

    }
    
    @objc func changeImage() {
        
        messageImageView.image = UIImage(systemName: "star")
    }
    
    
    



}
