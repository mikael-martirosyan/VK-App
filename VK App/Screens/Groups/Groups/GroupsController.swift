//
//  GroupsController.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 29.03.2022.
//

import UIKit
import PromiseKit

class GroupsController: UITableViewController {
    
    // MARK: - Properties
    
    private let networkService = GroupsNetworkService()
    private var groups = [GroupsGetItem]()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = Title.groups.rawValue
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(groupSearch))
        
        tableView.registerCell(UniversalTableViewCell.self)
        
//        networkService.get { [weak self] response in
//            guard let self = self else { return }
//            self.groups = response.items
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
        
        // Fetching data with PromiseKit
        firstly {
            networkService.fetchData()
        }.then { data in
            self.networkService.parseData(data: data)
        }.done { groups in
            self.groups = groups.items
            self.tableView.reloadData()
        }.catch { error in
            print(error)
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
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as UniversalTableViewCell
        
//        DispatchQueue.global().async {
//            if let url = URL(string: self.groups[indexPath.row].photo50) {
//                Networking.fetchImage(url: url) { image in
//                    DispatchQueue.main.async {
//                        cell.avatar.image = image
//                    }
//                }
//            }
//        }
        
        // Fetching image with PromiseKit
        if let url = URL(string: self.groups[indexPath.row].photo50) {
            firstly {
                Networking.fetchImage(url: url)
            }.done { image in
                cell.avatarImageView.image = image
            }.catch { error in
                print(error)
            }
        }

        cell.nameLabel.text = groups[indexPath.row].name

        return cell
    }
    
    #warning("Исправить работу удаления группы")
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let group = groups[indexPath.row]
            networkService.leave(by: group.id)
            #warning("Добавить alert об ошибке удаления")
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
