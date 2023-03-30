//
//  NewsfeedGetResult.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 02.04.2022.
//

import Foundation

    // MARK: - Result

struct NewsfeedGetResult: Decodable {
    let response: NewsfeedGetResponse
}

    // MARK: - Response

struct NewsfeedGetResponse: Decodable {
    let items: [NewsfeedGetItem]
    let groups: [NewsfeedGetGroup]
    let profiles: [NewsfeedGetProfile]
    let nextFrom: String
    
    enum CodingKeys: String, CodingKey {
        case items, groups, profiles
        case nextFrom = "next_from"
    }
}

    // MARK: - Item

struct NewsfeedGetItem: Decodable {
    let sourceID: Int
    let postID: Int
    let date: TimeInterval
    let text: String?
    let comments: CountableItem
    let likes: Likes
    let reposts: CountableItem
    let views: CountableItem?
    let attachments: [Attachments]?

    enum CodingKeys: String, CodingKey {
        case sourceID = "source_id"
        case postID = "post_id"
        case date
        case text
        case comments, likes, reposts, views
        case attachments
    }
}

/// Struct for all countable items
struct CountableItem: Decodable {
    let count: Int?
}

struct Likes: Decodable {
    let count: Int?
    let userLikes: Int

    enum CodingKeys: String, CodingKey {
        case count
        case userLikes = "user_likes"
    }
}

    // MARK: - Ptofiles

struct NewsfeedGetProfile: Decodable {
    let id: Int
    let firstName: String
    let lastName: String
    let photo50: String
    var fullName: String {
        return firstName + " " + lastName
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo50 = "photo_50"
    }
}

    // MARK: - Groups

struct NewsfeedGetGroup: Decodable {
    let id: Int
    let name: String
    let photo50: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case photo50 = "photo_50"
    }
}

struct Attachments: Decodable {
    let type: String
    let photo: Photo?
}

struct Photo: Decodable {
//    let albumID, date, id, ownerID: Int
//    let accessKey: String
//    let postID: Int
    let sizes: [NewsfeedPhotoSize]
//    let text: String
//    let userID: Int
    let accessKey: String

    enum CodingKeys: String, CodingKey {
//        case albumID = "album_id"
//        case date, id
//        case ownerID = "owner_id"
//        case accessKey = "access_key"
//        case postID = "post_id"
        case sizes //, text
//        case userID = "user_id"
        case accessKey = "access_key"
    }
}

struct NewsfeedPhotoSize: Decodable {
    let height: Int
    let url: String
    let type: String
    let width: Int
}

