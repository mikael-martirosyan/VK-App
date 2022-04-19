//
//  GroupsController.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 29.03.2022.
//

import UIKit
import Alamofire

class GroupsController: UITableViewController {
    
    // MARK: - Properties
    
    private let networkService = GroupsNetworkService()
    private var groups = [GroupsGetItem]()
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = Title.groups.rawValue
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(groupSearch))
        
        tableView.register(GroupsCell.self, forCellReuseIdentifier: CellIdentifier.groupsCell.rawValue)
        
        networkService.get { [weak self] response in
            guard let self = self else { return }
            self.groups = response.items
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Functions
    
    @objc private func groupSearch() {
        let groupSearchController = GroupsSearchController()
        navigationController?.pushViewController(groupSearchController, animated: true)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.groupsCell.rawValue, for: indexPath) as? GroupsCell else { return UITableViewCell() }
        
        if let url = URL(string: groups[indexPath.row].photo50) {
            AF.download(url, method: .get).responseData { response in
                guard let data = response.value else { return }
                let image = UIImage(data: data)
                cell.avatar.image = image
            }
        }

        cell.name.text = groups[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let group = groups[indexPath.row]
            networkService.leave(by: group.id)
            groups.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
