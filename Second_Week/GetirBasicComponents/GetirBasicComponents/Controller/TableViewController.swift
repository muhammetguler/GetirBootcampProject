//
//  TableViewController.swift
//  GetirBasicComponents
//
//  Created by Muhammet Guler on 23.03.2024.
//

import UIKit

class TableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var cities = ["Ankara", "Tokat", "Izmir", "Amasya", "Adana"]
    var famous = ["Simit", "Tokat Kebabi", "Boyoz", "Corek", "Muzlu Sut"]
    var images = ["", "", "", "", ""]
    //imagelari ssete koy.
    
    var myCities = [City]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCities.append(City(name: "Ankara", famous: "Simit", image: ""))
        myCities.append(City(name: "Tokat", famous: "Tokat Kebabi", image: ""))
        myCities.append(City(name: "Izmir", famous: "Boyoz", image: ""))
        myCities.append(City(name: "Amasya", famous: "Corek", image: ""))
        myCities.append(City(name: "Adana", famous: "Muzlu Sut", image: ""))
        
        // if we prefer to use customcell:
        //tableView.register(UINib(nibName: "CityCell", bundle: nil), forCellReuseIdentifier: "cityCell")

    }
}

extension TableViewController:UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cities.count
    }
    
    // Kingfisher, AlamofireImage, SDWebImage
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        cell.textLabel?.text = myCities[indexPath.row].name
        //cell.textLabel?.text = cities[indexPath.row]
        cell.detailTextLabel?.text = myCities[indexPath.row].famous
        // cell.detailTextLabel?.text = famous[indexPath.row] // storyboard da cell in style ini degis.
        cell.detailTextLabel?.text = myCities[indexPath.row].image
        //cell.imageView?.image = UIImage(named: images[indexPath.row])
        
        /*
        // if we prefer to use customcell:
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityCellTableViewCell
        
         cell.setup(model: myCities[indexPath.row])
        */
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: "\(myCities[indexPath.row].name)", message: "\(myCities[indexPath.row].famous)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
         
    }
    
    
}
