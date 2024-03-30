//
//  SenderViewController.swift
//  GetirBasicComponents
//
//  Created by Muhammet Guler on 23.03.2024.
//

import UIKit

protocol MessageDelegate:AnyObject { // classlar icin conform edilebilir hale getirdik AnyObject yazarak
    func sendMessage(text:String)
    
}

class SenderViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendMessageButton: UIButton!
    
    weak var delegate:MessageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendMessageAction(_ sender: Any) {
        
        guard let text = messageTextField.text else { return }
        delegate?.sendMessage(text: text)
        
        dismiss(animated: true)
        
    }
    

}
