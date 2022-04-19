//
//  FriendsNetworkService.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 31.03.2022.
//

import Foundation
import Alamofire

class FriendsNetworkService {
    
    private let baseUrl = "https://api.vk.com/method/friends"
    private let session = Session.shared
    private let version = "5.131"

    // MARK: - .get
    func get(completion: @escaping (FriendsGetResponse) -> Void) {
        
        let path = ".get"
        let url = baseUrl + path
        
        guard let token = session.token else { return }
        
        let params: Parameters = [
            "order": "hints",
            "fields": "photo_50",
            "access_token": token,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseData { response in
            guard let data = response.value else { return print("get friends data error") }
            
            do {
                let response = try JSONDecoder().decode(FriendsGetResult.self, from: data).response
                completion(response)
            } catch {
                print(error)
            }
        }
    }
}
