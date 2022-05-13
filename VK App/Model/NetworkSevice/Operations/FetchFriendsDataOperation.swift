//
//  FetchFriendsDataOperation.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 13.05.2022.
//

import Foundation

class FetchFriendsDataOperation: Operation {

    var data: Data?
    
    override func main() {
        
        let version = "5.131"
        let session = Session.shared
        let path = "/friends.get"
        
        guard let token = session.token else { return }
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method" + path
        urlComponents.queryItems = [
            URLQueryItem(name: "order", value: "hints"),
            URLQueryItem(name: "fields", value: "photo_50"),
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: version)
        ]
        
        guard let url = urlComponents.url else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        self.data = data
    }
}
