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
    
    let refControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .systemGray
        refreshControl.addTarget(self, action: #selector(refreshNewsfeed(sender:)), for: .valueChanged)
        return refreshControl
    }()
    
    var nextFrom = ""
    var isLoading = false
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConfig()

        newsfeedNetworkService.get { [weak self] response in
            guard let self = self,
                  let nextFrom = response.first?.nextFrom
            else { return }
            self.newsList = response
            self.nextFrom = nextFrom
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionCellsEnum = SectionCellsEnum(rawValue: indexPath.row)
        
        switch sectionCellsEnum {
        case .photo:
            let tableWidth = tableView.bounds.width
            guard let aspectRatio = newsList[indexPath.section].aspectRatio else { return 0 }
            let height = tableWidth * aspectRatio
            return height
        case .footer:
            return 10
        case .text:
            return UITableView.automaticDimension
        default:
            return UITableView.automaticDimension
        }
    }
}
