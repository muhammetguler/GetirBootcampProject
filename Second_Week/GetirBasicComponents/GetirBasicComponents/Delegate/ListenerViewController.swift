//
//  ListenerViewController.swift
//  GetirBasicComponents
//
//  Created by Muhammet Guler on 23.03.2024.
//

import UIKit

class ListenerViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var getDataButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getDataAction(_ sender: Any) {
        
        let senderVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "SenderViewController") as! SenderViewController
        
        senderVC.delegate = self
        present(senderVC, animated: true)
        
    }
    

}

extension ListenerViewController:MessageDelegate {
    func sendMessage(text: String) {
        messageLabel.text = text
    }
    
    
}
