//
//  NewsfeedNetworkService.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 02.04.2022.
//

import UIKit
import Alamofire

struct NewsfeedStruct {
    let sourceID: Int
    let postID: Int
    let avatar: String
    let name: String
    let date: Double
    let text: String
    let photoURL: String?
    let height: Int?
    let width: Int?
    let likesCount: Int
    let commentsCount: Int
    let repostsCount: Int
    let viewsCount: Int
    let userLikes: Int
}

class NewsfeedNetworkService {
    
    private let baseUrl = "https://api.vk.com/method/newsfeed"
    private let session = Session.shared
    private let version = "5.131"
    
    // MARK: - .get
    
    func get(completion: @escaping ([NewsfeedStruct]) -> Void) {
        
        let path = ".get"
        let url = baseUrl + path
        
        guard let token = session.token else { return }
        
        let params: Parameters = [
            "filters": "post",
            "count": 15,
            "access_token": token,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseData { response in
            guard let data = response.value else { return }
            
            do {
                let response = try JSONDecoder().decode(NewsfeedGetResult.self, from: data).response
                
                var sourceID: Int?
                var postID: Int
                var avatar: String?
                var name: String?
                var date: Double
                var text: String
                var photoURL: String?
                var height: Int?
                var width: Int?
                var likesCount: Int
                var commentsCount: Int
                var repostsCount: Int
                var viewsCount: Int
                var userLikes: Int
                
                var news = [NewsfeedStruct]()
                
                for item in response.items {
                    sourceID = item.sourceID
                    postID = item.postID
                    date = item.date
                    text = item.text
                    likesCount = item.likes.count
                    commentsCount = item.comments.count
                    repostsCount = item.reposts.count
                    viewsCount = item.views.count
                    userLikes = item.likes.userLikes

                    if let attechments = item.attechments {
                        for item in attechments {
                            guard let photo = item.photo else { return }
                            for size in photo.sizes {
                                if size.type == "x" {
                                    let url = size.url
                                    photoURL = url
                                    height = size.height
                                    width = size.width
                                }
                            }
                        }
                    }
                    
                    if item.sourceID < 0 {
                        let groupID = item.sourceID * -1
                        
                        for group in response.groups {
                            if group.id == groupID {
                                avatar = group.photo50
                                name = group.name
                            }
                        }
                    } else {
                        for profile in response.profiles {
                            if profile.id == item.sourceID {
                                avatar = profile.photo50
                                name = profile.fullName
                            }
                        }
                    }
                    
                    guard let sourceID = sourceID,
                          let avatar = avatar,
                          let name = name
                    else { return }
                    
                    news.append(NewsfeedStruct(sourceID: sourceID,
                                               postID: postID,
                                               avatar: avatar,
                                               name: name,
                                               date: date,
                                               text: text,
                                               photoURL: photoURL ?? nil,
                                               height: height ?? nil,
                                               width: width ?? nil,
                                               likesCount: likesCount,
                                               commentsCount: commentsCount,
                                               repostsCount: repostsCount,
                                               viewsCount: viewsCount,
                                               userLikes: userLikes)
                    )
                }
                
                completion(news)
            } catch {
                print(error)
            }
        }
    }
}
