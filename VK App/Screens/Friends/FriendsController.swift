//
//  FriendsController.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 29.03.2022.
//

import UIKit
import PromiseKit

class FriendsController: UITableViewController {
        
    // MARK: - Properties
    
    private let friendsNetworkService = FriendsNetworkService()
    var friends = [FriendsGetItem]()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationItem.title = Title.friends.rawValue
        
        tableView.registerCell(UniversalTableViewCell.self)
        
        // Получение данных с использованием DispatchQueue
//        friendsNetworkService.get { [weak self] response in
//            guard let self = self else { return }
//            self.friends = response.items
//            DispatchQueue.main.sync {
//                self.tableView.reloadData()
//            }
//        }
        
        // Получение данных с использованием Operation
        chainOfOperations()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as UniversalTableViewCell
        
        DispatchQueue.global().async {
            if let url = URL(string: self.friends[indexPath.row].photo50) {
                Networking.fetchImage(url: url) { image in
                    DispatchQueue.main.async {
                        cell.avatarImageView.image = image
                    }
                }
            }
        }
        
        cell.nameLabel.text = friends[indexPath.row].fullName

        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let layout = UICollectionViewFlowLayout()
        let photosVC = PhotosController(collectionViewLayout: layout)
        navigationController?.pushViewController(photosVC, animated: true)
        photosVC.ownerID = self.friends[indexPath.row].id
    }
}
