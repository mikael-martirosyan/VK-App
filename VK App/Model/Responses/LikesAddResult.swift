//
//  LikesAddResult.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 12.04.2022.
//

import Foundation

struct LikesAddResult: Codable {
    let response: LikesAddResponse
}

struct LikesAddResponse: Codable {
    let likes: Int
}
