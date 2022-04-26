//
//  FriendsController.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 29.03.2022.
//

import UIKit
import Alamofire

class FriendsController: UITableViewController {
    
    // MARK: - Properties
    
    private let friendsNetworkService = FriendsNetworkService()
    private let photosNetworkService = PhotosNetworkService()
    private var friends = [FriendsGetItem]()
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationItem.title = Title.friends.rawValue
        
        tableView.register(FriendsCell.self, forCellReuseIdentifier: CellIdentifier.friendsCell.rawValue)
        
        friendsNetworkService.get { [weak self] response in
            guard let self = self else { return }
            self.friends = response.items
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.friendsCell.rawValue, for: indexPath) as? FriendsCell else { return UITableViewCell() }
        
        if let url = URL(string: friends[indexPath.row].photo50) {
            FetchImage.fetchImage(url: url) { image in
                cell.avatar.image = image
            }
        }
        
        cell.name.text = friends[indexPath.row].fullName

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
        photosNetworkService.getAll(ownerID: friends[indexPath.row].id) { response in
            photosVC.photos = response
            photosVC.collectionView.reloadData()
        }
    }
}
