//
//  NewsfeedController + Extension.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 16.04.2022.
//

import UIKit
import Alamofire

extension NewsfeedController {
    
    // MARK: - Functions
    
    /// Custom summary: Register all cells in tableView
    func registerCells() {
        tableView.register(SourceCell.self, forCellReuseIdentifier: CellIdentifier.sourceCell.rawValue)
        tableView.register(TextCell.self, forCellReuseIdentifier: CellIdentifier.textCell.rawValue)
        tableView.register(NewsfeedPhotoCell.self, forCellReuseIdentifier: CellIdentifier.newsfeedPhotoCell.rawValue)
        tableView.register(InteractionsCell.self, forCellReuseIdentifier: CellIdentifier.interactionsCell.rawValue)
    }
    
    /// Custom summary: Checking userLike for set up LikeControl
    func checkUserLike(by state: Int, completion: @escaping(UIImage, UIColor) -> Void) {
        switch state {
        case 1:
            guard let image = UIImage(systemName: "fill.heart") else { return }
            let color = UIColor.red
            completion(image, color)
        default:
            guard let image = UIImage(systemName: "heart") else { return }
            let color = UIColor.systemGray2
            completion(image, color)
        }
    }
    
    // MARK: - Configure the content of cells
    
    /// Custom summary: Configure source of news in newsfeed
    func configureSourceCell(by news: NewsfeedStruct, indexPath: IndexPath) -> SourceCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.sourceCell.rawValue, for: indexPath) as? SourceCell else { fatalError() }
        
        if let url = URL(string: news.avatar) {
            FetchImage.fetchImage(url: url) { image in
                cell.avatar.image = image
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
        
        if let photoURL = news.photoURL, let url = URL(string: photoURL) {
            FetchImage.fetchImage(url: url) { image in
                cell.photoImageView.image = image
            }
            
//            AF.download(url).responseData { [weak self] response in
//                guard let data = response.value,
//                      let image = UIImage(data: data)
//                else { return }
//                cell.photoImageView.image = image
                
//                guard let height = news.height,
//                      let width = news.width,
//                      let self = self
//                else { return }
//                cell.heightAnchor.constraint(equalToConstant: .getPhotoHeight(height: height, width: width, viewWidth: self.view.frame.width)).isActive = true
            cell.heightAnchor.constraint(equalToConstant: 350).isActive = true
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
//            }
        } else {
            cell.heightAnchor.constraint(equalToConstant: 0).isActive = true
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
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
        
        checkUserLike(by: news.userLikes) { image, color in
            cell.likesControl.likeImageView.image = image
            cell.likesControl.likeImageView.tintColor = color
            
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        }
        return cell
    }
}
