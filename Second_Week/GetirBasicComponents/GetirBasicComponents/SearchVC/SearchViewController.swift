//
//  SearchViewController.swift
//  GetirBasicComponents
//
//  Created by Muhammet Guler on 24.03.2024.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    lazy var users = [User]()
    lazy var filteredUsers = [User]()
    
    var isSearchBarEmpty:Bool {
        searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering:Bool {
        searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        
        title = "Search"
        super.viewDidLoad()
        
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let userListURL = URL(string: urlString) else { return }
        
        let users = try? JSONDecoder().decode([User].self, from: Data(contentsOf: userListURL))
        guard let users else { return }
        self.users = users
        
        configureSearchController()

    }
    
    private func configureSearchController() {
        searchController.searchBar.placeholder = "Search User"
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    func filterContextForSearchText(_ searchText: String) {
        filteredUsers = users.filter({ user in
            return user.name?.lowercased().contains(searchText.lowercased()) ?? false
        })
        
        tableView.reloadData()
    }
    
}

extension SearchViewController: UITableViewDataSource {
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
                
        return cell
    }
}

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContextForSearchText(searchBar.text!)
    }
    
}
