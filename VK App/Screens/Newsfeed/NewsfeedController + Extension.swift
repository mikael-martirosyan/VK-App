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
    
    /// Custom summary: Register all cells in tableView
    func registerCells() {
        tableView.register(SourceCell.self, forCellReuseIdentifier: CellIdentifier.sourceCell.rawValue)
        tableView.register(TextCell.self, forCellReuseIdentifier: CellIdentifier.textCell.rawValue)
        tableView.register(NewsfeedPhotoCell.self, forCellReuseIdentifier: CellIdentifier.newsfeedPhotoCell.rawValue)
        tableView.register(InteractionsCell.self, forCellReuseIdentifier: CellIdentifier.interactionsCell.rawValue)
        tableView.register(FooterCell.self, forCellReuseIdentifier: CellIdentifier.footerCell.rawValue)
    }
    
    /// Custom summary: Checking userLike for set up LikeControl
    func checkUserLike(by news: NewsfeedStruct, cell: InteractionsCell, completion: @escaping(UIImage, UIColor) -> Void) {
        switch news.userLikes {
        case 1:
            guard let image = UIImage(systemName: "heart.fill") else { return }
            let color = UIColor.red
            cell.likesControl.isLiked = news.userLikes
            cell.likesControl.itemID = news.postID
            if let accessKey = news.accessKey {
                cell.likesControl.accessKey = accessKey
            }
            
            completion(image, color)
        default:
            guard let image = UIImage(systemName: "heart") else { return }
            let color = UIColor.systemGray2
            cell.likesControl.isLiked = news.userLikes
            cell.likesControl.itemID = news.postID
            if let accessKey = news.accessKey {
                cell.likesControl.accessKey = accessKey
            }
            completion(image, color)
        }
    }
    
    // MARK: - Configure the content of cells
    
    /// Custom summary: Configure source of news in newsfeed
    func configureSourceCell(by news: NewsfeedStruct, indexPath: IndexPath) -> SourceCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.sourceCell.rawValue, for: indexPath) as? SourceCell else { fatalError() }
        
        DispatchQueue.global().async {
            if let url = URL(string: news.avatar) {
                Networking.fetchImage(url: url) { image in
                    DispatchQueue.main.async {
                        cell.avatar.image = image
                    }
                }
            }
        }
        
        cell.name.text = news.name
        cell.date.text = DateFormatter.getStringDate(date: news.date)
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        return cell
    }
    
    /// Custom summary: Configure text of news in newsfeed
    func configureTextCell(by news: NewsfeedStruct, indexPath: IndexPath) -> TextCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.textCell.rawValue, for: indexPath) as? TextCell else { fatalError() }
        if news.text == "" {
            cell.isHidden = true
        } else {
            cell.message.text = news.text
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        }
        return cell
    }
    
    /// Custom summary: Configure images of news in newsfeed
    func configurePhotoCell(by news: NewsfeedStruct, indexPath: IndexPath) -> NewsfeedPhotoCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.newsfeedPhotoCell.rawValue, for: indexPath) as? NewsfeedPhotoCell else { fatalError() }
        
        DispatchQueue.global().async {
            if let stringURL = news.photoURL, let url = URL(string: stringURL) {
                Networking.fetchImage(url: url) { image in
                    DispatchQueue.main.async {
                        cell.photoImageView.image = image
                        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    cell.photoImageView.heightAnchor.constraint(equalToConstant: 0).isActive = true
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
                }
            }
        }
                
        return cell
    }
    
    /// Custom summary: Configure likes, comments, reposts and views  of news in newsfeed
    func configureInteractionsCell(by news: NewsfeedStruct, indexPath: IndexPath) -> InteractionsCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.interactionsCell.rawValue, for: indexPath) as? InteractionsCell else { fatalError() }
        
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.footerCell.rawValue, for: indexPath) as? FooterCell else { fatalError() }
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        return cell
    }
    
    
//    func configureCell<T: UITableViewCell>(identifier: CellIdentifiers, indexPath: IndexPath, type: T) -> T {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier.rawValue, for: indexPath) as? T else { fatalError() }
//        return cell
//    }
    
    
    
//    func calculateCellHeight<T>(cell: T, indexPath: IndexPath, completion: (T) -> Void) {
//        guard let cell = tableView.cellForRow(at: indexPath) as? T else { return }
//        completion(cell)
//    }
    
    

}
