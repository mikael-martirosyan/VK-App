//
//  FriendsController + Extension.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 13.05.2022.
//

import Foundation

extension FriendsController {
    
    func chainOfOperations() {
        let operationQueue = OperationQueue()
        
        let fetchFriendsDataOperation = FetchFriendsDataOperation()
        let parseFriendsDataOperation = ParseFriendsDataOperation()
        let reloadTableViewControllerOperation = ReloadTableViewControllerOperation(controller: self)
        
        operationQueue.addOperation(fetchFriendsDataOperation)
        parseFriendsDataOperation.addDependency(fetchFriendsDataOperation)
        operationQueue.addOperation(parseFriendsDataOperation)
        reloadTableViewControllerOperation.addDependency(parseFriendsDataOperation)
        OperationQueue.main.addOperation(reloadTableViewControllerOperation)
    }
}
