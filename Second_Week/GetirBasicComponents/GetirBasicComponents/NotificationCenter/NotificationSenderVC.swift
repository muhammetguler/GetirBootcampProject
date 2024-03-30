//
//  NotificationSenderVC.swift
//  GetirBasicComponents
//
//  Created by Muhammet Guler on 23.03.2024.
//

import UIKit

class NotificationSenderVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sendNotificationAction(_ sender: Any) {
        
        NotificationCenter.default.post(name: .sendDataNotification, object: nil)
        dismiss(animated: true)
    }
    

}
