//
//  GroupSearchController + Extension.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 19.04.2022.
//

import UIKit

extension GroupsSearchController: UISearchBarDelegate {
    
    // MARK: - Set up search bar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText != "" {
            print("Text status before searching: \(searchText.isEmpty)")
//            timer?.invalidate()
//            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                networkService.search(request: searchText) { [weak self] response in
                    guard let self = self else { return }
                    self.groupSearch = response.items
                    print("Array after searching: \(self.groupSearch)")
                    print(searchText)
                    self.tableView.reloadData()
                }
//            }
//        } else {
//            print("Text status before deleting: \(searchText.isEmpty)")
//            groupSearch.removeAll()
//            print("Array after deleting: \(self.groupSearch)")
//            tableView.reloadData()
//        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        groupSearch.removeAll()
        print("Array after pressed cancel button: \(self.groupSearch)")
        tableView.reloadData()
    }
}
