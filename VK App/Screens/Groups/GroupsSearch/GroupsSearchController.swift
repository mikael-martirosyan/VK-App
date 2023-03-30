//
//  GroupsSearchController.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 31.03.2022.
//

import UIKit

class GroupsSearchController: UITableViewController {
    
    // MARK: - Properties
    
    let networkService = GroupsNetworkService()
    var groupSearch = [GroupsSearchItem]()
//    private let groupsController = GroupsController()
    private var timer: Timer?
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupConfig()
    }
    
    // MARK: - Set up view
    
    private func setupConfig() {
        view.backgroundColor = .systemBackground
        
        tableView.registerCell(UniversalTableViewCell.self)
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
//        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.title = Title.groupSearch.rawValue
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupSearch.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as UniversalTableViewCell
        
        DispatchQueue.global().async {
            if let url = URL(string: self.groupSearch[indexPath.row].photo50) {
                Networking.fetchImage(url: url) { image in
                    DispatchQueue.main.async {
                        cell.avatarImageView.image = image
                    }
                }
            }
        }

        cell.nameLabel.text = groupSearch[indexPath.row].name
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let newGroup = groupSearch[indexPath.row]
        if editingStyle == .insert {
            if newGroup.isMember == 0 {
                networkService.join(by: newGroup.id)
                
                let alert = UIAlertController(title: "", message: "Группа успешно добавлена", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                
                alert.addAction(action)
                present(alert, animated: true)
                
                #warning("Добавить alert об ошибке добавления")
            }
        }
    }
}
