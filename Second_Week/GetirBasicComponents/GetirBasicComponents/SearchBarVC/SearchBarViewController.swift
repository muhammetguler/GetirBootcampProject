//
//  SearchBarViewController.swift
//  GetirBasicComponents
//
//  Created by Muhammet Guler on 24.03.2024.
//

import UIKit

class SearchBarViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]()
    var filteredUsers = [User]()
    var isFiltering:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let userListURL = URL(string: urlString) else { return }
        
        let users = try? JSONDecoder().decode([User].self, from: Data(contentsOf: userListURL))
        guard let users else { return }
        self.users = users
        

    }
    


}

extension SearchBarViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredUsers.count
        }
        
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        if isFiltering {
            cell.textLabel?.text = filteredUsers[indexPath.row].name
        } else {
            cell.textLabel?.text = users[indexPath.row].name
        }
        
        // cell.detailTextLabel?.text = users[indexPath.row].company?.name
        
        return cell
    }

}

extension SearchBarViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isFiltering = true
        
        filteredUsers = users.filter({ user in
            return user.name?.lowercased().contains(searchText.lowercased()) ?? false
        })
        
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isFiltering = false
        searchBar.text = ""
        filteredUsers = [User]()
        tableView.reloadData()
    }
}
