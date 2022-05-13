//
//  LikesIsLiked.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 12.04.2022.
//

import Foundation

struct LikesIsLikedResult: Codable {
    let response: LikesIsLikedResponse
}

struct LikesIsLikedResponse: Codable {
    let liked: Int
}
