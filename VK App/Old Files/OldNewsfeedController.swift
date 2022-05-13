//
//  NewsfeedController.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 29.03.2022.
//

//import UIKit
//import Alamofire

//class NewsfeedController: UITableViewController {
//
////    private let likesNetworkService = LikesNetworkService()
//    private let newsfeedNetworkService = NewsfeedNetworkService()
//    var news = [NewsfeedStruct]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .systemBackground
//        navigationItem.title = Title.news.rawValue
//
//        tableView.register(NewsfeedCell.self, forCellReuseIdentifier: CellIdentifier.newsfeedCell.rawValue)
//
//        newsfeedNetworkService.get { [weak self] response in
//            guard let self = self else { return }
//            self.news = response
//            self.tableView.reloadData()
//        }
//    }
//
//    private func checkLike(source: Int, completion: @escaping (UIImage?, UIColor) -> Void) {
//        switch source {
//        case 1:
//            let image = UIImage(systemName: "heart.fill")
//            let tintColor = UIColor.red
//            completion(image, tintColor)
//        default:
//            let image = UIImage(systemName: "heart")
//            let tintColor = UIColor.systemGray2
//            completion(image, tintColor)
//        }
//    }
//
//
//    // MARK: - Table view data source
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return news.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.newsfeedCell.rawValue, for: indexPath) as? NewsfeedCell else { return UITableViewCell() }
//
//        let news = news[indexPath.row]
//
//        if let url = URL(string: news.avatar) {
//            AF.download(url).responseData { response in
//                guard let data = response.value else { return }
//                let image = UIImage(data: data)
//                cell.headerContentView.avatar.image = image
//            }
//        }
//
//        cell.headerContentView.name.text = news.name
//        cell.headerContentView.date.text = DateFormatter.getStringDate(date: news.date)
//
//        cell.newsText.text = news.text
//
//
////        if let url = URL(string: news.newsImage) {
////            AF.download(url).responseData { response in
////                guard let data = response.value else { return }
////                let image = UIImage(data: data)
////                cell.newsImage.image = image
//        //            }
//        //        }
//
//
//        checkLike(source: news.userLikes) { image, color in
//            guard let image = image else { return }
//            let likeImage = cell.footerContentView.likesControl.likeImage
//
//            likeImage.image = image
//            likeImage.tintColor = color
//        }
//
////        cell.footerContentView.likesControl.likesCount.text = news.likesCount
////        cell.footerContentView.commentsContentView.commentsCount.text = news.commentsCount
////        cell.footerContentView.repostsContentView.repostsCount.text = news.repostsCount
////        cell.footerContentView.viewsContentView.viewsCount.text = news.viewsCount
//
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//}
//
////extension NewsfeedController: LikeControlDelegate {
////
////    func addLike() {
////
////    }
////
////    func checkLiked() {
////        var state = 0
////
////        guard let indexPath = tableView.indexPathForSelectedRow else { return }
////        let itemID = news[indexPath.row].postID
////        let ownerID = news[indexPath.row].sourceID
////
////        print("Item ID: \(itemID), Owner ID: \(ownerID)")
////
////        likesNetworkService.isLiked(ownerID: ownerID, itemID: itemID) { response in
////            return state = response.liked
////        }
////    }
////}
