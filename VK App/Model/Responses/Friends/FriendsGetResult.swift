//
//  FriendsGetResult.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 31.03.2022.
//

import Foundation

struct FriendsGetResult: Decodable {
    let response: FriendsGetResponse
}

struct FriendsGetResponse: Decodable {
    let count: Int
    let items: [FriendsGetItem]
}

struct FriendsGetItem: Decodable {
    let id: Int
    let firstName, lastName: String
    let photo50: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo50 = "photo_50"
    }
}
