//
//  NewsfeedStruct.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 13.05.2022.
//

import UIKit

struct NewsfeedStruct {
    var sourceID: Int
    var postID: Int
    var avatar: String
    var name: String
    var date: Double
    var text: String
    var photoURL: String?
    var height: Int?
    var width: Int?
    var aspectRatio: CGFloat?
    var likesCount: Int
    var commentsCount: Int
    var repostsCount: Int
    var viewsCount: Int
    var userLikes: Int
//    var accessKey: String?
    var nextFrom: String
}
