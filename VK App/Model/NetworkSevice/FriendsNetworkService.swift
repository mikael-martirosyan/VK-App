//
//  FriendsNetworkService.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 31.03.2022.
//

import UIKit

class FriendsNetworkService {
    
    private let method = "/friends"
    
    // MARK: - .get
    func get(completion: @escaping (FriendsGetResponse) -> Void) {
    
        let path = method + ".get"
    
        let methodQueryItems = [
            URLQueryItem(name: "order", value: "hints"),
            URLQueryItem(name: "fields", value: "photo_50")
        ]
        
        Networking.request(path: path, optionItems: methodQueryItems) { data, error  in
            if let error = error {
                #warning("Обработать ошибки")
                // Обработать ошибки
                print(error)
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(FriendsGetResult.self, from: data)
                    completion(result.response)
                } catch {
                    #warning("Обработать ошибки")
                    // Обработать ошибки
                    print(error)
                }
            }
        }
    }
}
