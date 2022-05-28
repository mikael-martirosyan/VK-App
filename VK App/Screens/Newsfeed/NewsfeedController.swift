//
//  NewsfeedController.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 16.04.2022.
//

import UIKit

class NewsfeedController: UITableViewController {
    
    // MARK: - Properties
    
    var newsList = [NewsfeedStruct]()
    let newsfeedNetworkService = NewsfeedNetworkService()
    let likesNetworkService = LikesNetworkService()
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .systemBackground
        title = Title.news.rawValue
        registerCells()

        newsfeedNetworkService.get { [weak self] response in
            guard let self = self else { return }
            self.newsList = response
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return newsList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SectionCellsEnum.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let news = newsList[indexPath.section]
        let sectionCellsEnum = SectionCellsEnum(rawValue: indexPath.row)
        
        switch sectionCellsEnum {
        case .source:
            return configureSourceCell(by: news, indexPath: indexPath)
        case .text:
            return configureTextCell(by: news, indexPath: indexPath)
        case .photo:
            return configurePhotoCell(by: news, indexPath: indexPath)
        case .interactions:
            return configureInteractionsCell(by: news, indexPath: indexPath)
        case .footer:
            return configureFooterCell(indexPath: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return tableView.deselectRow(at: indexPath, animated: false)
    }
}
