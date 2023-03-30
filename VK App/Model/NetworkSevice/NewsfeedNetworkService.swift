//
//  NewsfeedNetworkService.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 02.04.2022.
//

import UIKit
//import SwiftyJSON

class NewsfeedNetworkService {
    
    let method = "/newsfeed"
    
    // MARK: - .get
    
    func get(startTime: TimeInterval? = nil, startFrom: String? = "", completion: @escaping ([NewsfeedStruct]) -> Void) {
        
        let path = method + ".get"

        var methodQueryItems = [
            URLQueryItem(name: "filters", value: "post"),
            URLQueryItem(name: "count", value: "10")
        ]
        
        if let startTime = startTime {
            methodQueryItems.append(URLQueryItem(name: "start_time", value: String(startTime)))
        } else if let startFrom = startFrom {
            methodQueryItems.append(URLQueryItem(name: "start_from", value: String(startFrom)))
        }
        
        Networking.request(path: path, optionItems: methodQueryItems) { data, error in
            if let error = error {
                #warning("Обработать ошибки")
                // Обработать ошибки
                print(error)
            } else if let data = data {
                
//                let json = JSON(data)
//
//                let itemsJSONArray = json["response"]["items"].arrayValue
//                let groupsJSONArray = json["response"]["groups"].arrayValue
//                let profilesJSONArray = json["response"]["profiles"].arrayValue
//                let nextFrom = json["response"]["next_from"].stringValue
//
//                var items = [NewsfeedGetItem]()
//                var groups = [NewsfeedGetGroup]()
//                var profiles = [NewsfeedGetProfile]()
//
//                let dispatchGroup = DispatchGroup()
//
//                DispatchQueue.global().async(group: dispatchGroup) {
//                    for item in itemsJSONArray {
//                        do {
//                            let response = try JSONDecoder().decode(NewsfeedGetItem.self, from: item.rawData())
//                            items.append(response)
//                        } catch {
//                            print(error)
//                        }
//                    }
//                }
//
//                DispatchQueue.global().async(group: dispatchGroup) {
//                    for group in groupsJSONArray {
//                        do {
//                            let response = try JSONDecoder().decode(NewsfeedGetGroup.self, from: group.rawData())
//                            groups.append(response)
//                        } catch {
//                            print(error)
//                        }
//                    }
//                }
//
//                DispatchQueue.global().async(group: dispatchGroup) {
//                    for profile in profilesJSONArray {
//                        do {
//                            let response = try JSONDecoder().decode(NewsfeedGetProfile.self, from: profile.rawData())
//                            profiles.append(response)
//                        } catch {
//                            print(error)
//                        }
//                    }
//                }
//
//                dispatchGroup.notify(queue: DispatchQueue.main) {
//                    let news = NewsfeedStruct(items: items, groups: groups, profiles: profiles, nextFrom: nextFrom)
//
//                    completion(news)
//                }
                
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
                                                  aspectRatio: nil,
                                                  likesCount: item.likes.count ?? 0,
                                                  commentsCount: item.comments.count ?? 0,
                                                  repostsCount: item.reposts.count ?? 0,
                                                  viewsCount: item.views?.count ?? 0,
                                                  userLikes: item.likes.userLikes,
//                                                  accessKey: nil,
                                                  nextFrom: response.nextFrom
                        )

                        item.attachments?.forEach { attachments in
                            if let size = attachments.photo?.sizes.first(where: { $0.type == PhotoTypeCases.x.rawValue }) {
                                news.photoURL = size.url
                                news.height = size.height
                                news.width = size.width
                                news.aspectRatio = CGFloat(news.height ?? 0) / CGFloat(news.width ?? 1)
                            }
//                            guard let accessKey = attachments.photo?.accessKey else { return print("NO ACCESS KEY") }
//                            news.accessKey = accessKey
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
