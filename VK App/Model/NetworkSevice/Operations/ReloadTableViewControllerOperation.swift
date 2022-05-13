//
//  ReloadTableViewControllerOperation.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 13.05.2022.
//

import Foundation

class ReloadTableViewControllerOperation: Operation {
    
    var friendsController: FriendsController
    
    override func main() {
        guard let parseFriendsData = dependencies.first as? ParseFriendsDataOperation,
              let data = parseFriendsData.outputData
        else { return }
        
        friendsController.friends = data
        friendsController.tableView.reloadData()
    }
    
    init(controller: FriendsController) {
        self.friendsController = controller
    }
}
