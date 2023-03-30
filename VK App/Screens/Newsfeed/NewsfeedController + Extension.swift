//
//  NewsfeedController + Extension.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 16.04.2022.
//

import UIKit

//enum isLiked: Int {
//    case notLiked = 0
//    case liked = 1
//}

extension NewsfeedController {
    
    // MARK: - Functions
    
    func setupConfig() {
        tableView.backgroundColor = .systemBackground
        
        tableView.refreshControl = refControl
        tableView.prefetchDataSource = self
        
        title = Title.news.rawValue
        registerCells()
    }
    
    /// Custom summary: Register all cells in tableView
    private func registerCells() {
        tableView.registerCell(SourceCell.self)
        tableView.registerCell(TextCell.self)
        tableView.registerCell(NewsfeedPhotoCell.self)
        tableView.registerCell(InteractionsCell.self)
        tableView.registerCell(FooterCell.self)
    }
    
    /// Custom summary: Checking userLike for set up LikeControl
    func checkUserLike(by news: NewsfeedStruct, cell: InteractionsCell, completion: @escaping(UIImage, UIColor) -> Void) {
        switch news.userLikes {
        case 1:
            guard let image = UIImage(systemName: "heart.fill") else { return }
            let color = UIColor.red
            cell.likesControl.isLiked = news.userLikes
            cell.likesControl.itemID = news.postID
//            if let accessKey = news.accessKey {
//                cell.likesControl.accessKey = accessKey
//            }
            
            completion(image, color)
        default:
            guard let image = UIImage(systemName: "heart") else { return }
            let color = UIColor.systemGray2
            cell.likesControl.isLiked = news.userLikes
            cell.likesControl.itemID = news.postID
//            if let accessKey = news.accessKey {
//                cell.likesControl.accessKey = accessKey
//            }
            completion(image, color)
        }
    }
    
    /// Custom summary: Pull-to-refresh pattern
    @objc func refreshNewsfeed(sender: UIRefreshControl) {
        sender.beginRefreshing()
        
        let mostFreshNewsDate = newsList.first?.date ?? Date().timeIntervalSince1970
        
        self.newsfeedNetworkService.get(startTime: mostFreshNewsDate + 1) { [weak self] news in
            guard let self = self else { return }
    
            DispatchQueue.main.async {
                sender.endRefreshing()
            }
            
            guard news.count > 0 else { return }
            
            self.newsList = news + self.newsList
            
            let indexSet = IndexSet(integersIn: 0..<news.count)
            
            DispatchQueue.main.async {
                self.tableView.insertSections(indexSet, with: .automatic)
            }
        }
    }
    
    // MARK: - Configure the content of cells
    
    /// Custom summary: Configure source of news in newsfeed
    func configureSourceCell(by news: NewsfeedStruct, indexPath: IndexPath) -> SourceCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SourceCell
        
        DispatchQueue.global().async {
            if let url = URL(string: news.avatar) {
                Networking.fetchImage(url: url) { image in
                    DispatchQueue.main.async {
                        cell.avatarImageView.image = image
                    }
                }
            }
        }
        
        cell.nameLabel.text = news.name
        cell.dateLabel.text = DateFormatter.getStringDate(date: news.date)
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        return cell
    }
    
    /// Custom summary: Configure text of news in newsfeed
    func configureTextCell(by news: NewsfeedStruct, indexPath: IndexPath) -> TextCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TextCell
        cell.message.text = news.text
        
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        return cell
    }
    
    /// Custom summary: Configure images of news in newsfeed
    func configurePhotoCell(by news: NewsfeedStruct, indexPath: IndexPath) -> NewsfeedPhotoCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as NewsfeedPhotoCell
        
        DispatchQueue.global().async {
            if let stringURL = news.photoURL, let url = URL(string: stringURL) {
                Networking.fetchImage(url: url) { image in
                    DispatchQueue.main.async {
                        cell.photoImageView.image = image
                        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
                    }
                }
            }
        }
        
        return cell
    }
    
    /// Custom summary: Configure likes, comments, reposts and views  of news in newsfeed
    func configureInteractionsCell(by news: NewsfeedStruct, indexPath: IndexPath) -> InteractionsCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as InteractionsCell
        
        cell.likesControl.likesCount.text = news.likesCount.roundAndConvert()
        cell.commentsControl.commentsCount.text = news.commentsCount.roundAndConvert()
        cell.repostsControl.repostsCount.text = news.repostsCount.roundAndConvert()
        cell.viewsContentView.viewsCount.text = news.viewsCount.roundAndConvert()
        
        checkUserLike(by: news, cell: cell) { image, color in
            cell.likesControl.likeImageView.image = image
            cell.likesControl.likeImageView.tintColor = color
            
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        }
        return cell
    }
    
    /// Custom summary: Configure footer
    func configureFooterCell(indexPath: IndexPath) -> FooterCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as FooterCell
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        return cell
    }
    
    
    // Прототип дженерика для конфигурации ячеек - на доработке
//    func configureCell<T: UITableViewCell>(identifier: String,
//                                           stringURL: String? = nil,
//                                           indexPath: IndexPath,
//                                           type: T,
//                                           completion: @escaping (T, UIImage) -> Void) -> T {
//
//        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as T
//
//        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
//
//        DispatchQueue.global().async {
//            if let stringURL = stringURL, let url = URL(string: stringURL) {
//                Networking.fetchImage(url: url) { image in
//                    DispatchQueue.main.async {
//                        completion(cell, image)
//                    }
//                }
//            }
//        }
//
//        return cell
//    }
}

// MARK: - Table view data source prefetching
extension NewsfeedController: UITableViewDataSourcePrefetching {
    
    /// Custom summary: Infinite scrolling pattern
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let maxSection = indexPaths.map({ $0.section }).max() else { return }
        
        if maxSection > newsList.count - 3 && !isLoading {
            
            isLoading = true
            
            self.newsfeedNetworkService.get(startFrom: nextFrom) { [weak self] news in
                guard let self = self else { return }
                let indexSet = IndexSet(integersIn: self.newsList.count ..< self.newsList.count + news.count)
                
                self.newsList.append(contentsOf: news)
                self.nextFrom = news.first?.nextFrom ?? self.nextFrom
                
                DispatchQueue.main.async {
                    self.tableView.insertSections(indexSet, with: .automatic)
                }
                self.isLoading = false
            }
        }
    }
}
