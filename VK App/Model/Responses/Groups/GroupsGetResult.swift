//
//  GroupsGetJSON.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 31.03.2022.
//

import Foundation

struct GroupsGetResult: Codable {
    let response: GroupsGetResponse
}

struct GroupsGetResponse: Codable {
    let count: Int
    let items: [GroupsGetItem]
}

struct GroupsGetItem: Codable {
    let id: Int
    let name: String
    let photo50: String
    let isMember: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case photo50 = "photo_50"
        case isMember = "is_member"
    }
}
