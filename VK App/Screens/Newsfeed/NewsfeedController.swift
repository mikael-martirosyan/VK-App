//
//  NewsfeedController.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 16.04.2022.
//

import UIKit
import Alamofire

class NewsfeedController: UITableViewController {
    
    // MARK: - Properties
    
    var newsList = [NewsfeedStruct]()
    let networkService = NewsfeedNetworkService()
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .systemBackground
        title = Title.news.rawValue
        registerCells()

        networkService.get { [weak self] response in
            guard let self = self else { return }
            self.newsList = response
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return newsList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostStruct.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let news = newsList[indexPath.section]
        let postStruct = PostStruct(rawValue: indexPath.row)
        
        switch postStruct {
        case .source:
            return configureSourceCell(by: news, indexPath: indexPath)
        case .text:
            return configureTextCell(by: news, indexPath: indexPath)
        case .photo:
            return configurePhotoCell(by: news, indexPath: indexPath)
        case .interactions:
            return configureInteractionsCell(by: news, indexPath: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    // MARK: - Table view delegate
    
    #warning("Заменить footer на view")
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 5))
        view.backgroundColor = .gray
        view.alpha = 0.1
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return tableView.deselectRow(at: indexPath, animated: false)
    }
}
