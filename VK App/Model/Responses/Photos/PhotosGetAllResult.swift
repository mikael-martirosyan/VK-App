//
//  PhotosGetAllResult.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 21.04.2022.
//

import Foundation

struct PhotosGetAllResult: Decodable {
    let response: PhotosGetAllResponse
}

struct PhotosGetAllResponse: Decodable {
    let count: Int
    let items: [PhotosGetAllItem]
}

struct PhotosGetAllItem: Decodable {
    let id: Int
    let ownerID: Int
    let sizes: [PhotoGetAllSize]
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case sizes
    }
}

struct PhotoGetAllSize: Decodable {
    let url: String
    let type: String
//    let width: Int
//    let height: Int
}
