//
//  NewsfeedNetworkService.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 02.04.2022.
//

import UIKit

class NewsfeedNetworkService {
    
    let method = "/newsfeed"
    
    // MARK: - .get
    
    func get(completion: @escaping ([NewsfeedStruct]) -> Void) {
        
        let path = method + ".get"

        let methodQueryItems = [
            URLQueryItem(name: "filters", value: "post"),
            URLQueryItem(name: "count", value: "50")
        ]
        
        Networking.request(path: path, optionItems: methodQueryItems) { data, error in
            if let error = error {
                #warning("Обработать ошибки")
                // Обработать ошибки
                print(error)
            } else if let data = data {
                do {
                    let response = try JSONDecoder().decode(NewsfeedGetResult.self, from: data).response
                    
                    var newsList = [NewsfeedStruct]()
                    
                    for item in response.items {
                        var news = NewsfeedStruct(sourceID: item.sourceID,
                                                  postID: item.postID,
                                                  avatar: "",
                                                  name: "",
                                                  date: item.date,
                                                  text: item.text ?? "",
                                                  photoURL: nil,
                                                  height: nil,
                                                  width: nil,
                                                  likesCount: item.likes.count ?? 0,
                                                  commentsCount: item.comments.count ?? 0,
                                                  repostsCount: item.reposts.count ?? 0,
                                                  viewsCount: item.views?.count ?? 0,
                                                  userLikes: item.likes.userLikes)
                        
                        item.attachments?.forEach { attachments in
                            if let size = attachments.photo?.sizes.first(where: { $0.type == "x" }) {
                                news.photoURL = size.url
                                news.height = size.height
                                news.width = size.width
                            }
                        }

                        if item.sourceID < 0,
                           let group = response.groups.first(where: { $0.id == item.sourceID * -1}) {
                                news.avatar = group.photo50
                                news.name = group.name
                        } else if let profile = response.profiles.first(where: { $0.id == item.sourceID }) {
                            news.avatar = profile.photo50
                            news.name = profile.fullName
                        }
                        
                        newsList.append(news)
                    }
                    
                    completion(newsList)
                } catch {
                    print(error)
                }
            }
        }
    }
}
