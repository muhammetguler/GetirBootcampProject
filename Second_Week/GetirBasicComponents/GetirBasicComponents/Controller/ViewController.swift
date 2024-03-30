//
//  ViewController.swift
//  GetirBasicComponents
//
//  Created by Muhammet Guler on 23.03.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Merhaba uygulama ayaga kalkti.")
        
        /*
        let frame = CGRect(x: 0, y: 0, width: 300, height: 500)
        
        let label = UILabel(frame: frame)
        label.backgroundColor = .blue
        label.text = "Getir Bootcampe hosgeldiniz"
        label.textColor = .white
        // label.textColor = UIColor(red: 210/255, green: 100/255, blue: 20/255, alpha: 1)
        label.font = UIFont(name: "Avenir", size: 20)
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 0 // satir sayisini kendisine gore ayarlayacak
        
        
        view.addSubview(label)
        */
         
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.setTitleColor(.gray, for: .normal)
        
    }

    @IBAction func saveAction(_ sender: Any) {
        
        guard let message = messageTextField.text, !message.isEmpty else { return } // message.count > 0 daha verimsiz..
        
        messageLabel.text = message
        
        // if the messageTextField.text is empty, then it will return "" not nil, so we have to write another condition.
        
    }
    
}

