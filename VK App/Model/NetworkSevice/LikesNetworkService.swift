//
//  LikesNetworkService.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 12.04.2022.
//

import Foundation
import Alamofire

class LikesNetworkService {
    
    let baseUrl = "https://api.vk.com/method/likes"
    let session = Session.shared
    let version = "5.131"
    
    // MARK: - .add
    
    func add(itemID: Int, completion: @escaping (Int) -> Void) {
        
        let path = ".add"
        let url = baseUrl + path
        
        guard let token = session.token else { return }
        
        let params: Parameters = [
            "type": "post",
            "item_id": itemID,
            "access_token": token,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseData { response in
            guard let data = response.value else { return }
            
            do {
                let response = try JSONDecoder().decode(LikesAddResult.self, from: data).response
                completion(response.likes)
            } catch {
                print(error)
            }
        }
    }
    
    // MARK: - .delete
    
//    func delete(ownerID: Int, itemID: Int, completion: @escaping (Int) -> Void) {
//
//        let path = ".delete"
//        let url = baseUrl + path
//
//        guard let token = session.token else { return }
//
//        let params: Parameters = [
//            "type": "post",
//            "owner_id": ownerID,
//            "item_id": itemID,
//
//        ]
//        AF.request(url, method: .get, parameters: params).responseData { response in
//            guard let data = response.value else { response }
//
//            do {
//                let response = try JSONDecoder().decode(Lik, from: <#T##Data#>)
//
//            } catch {
//                print(error)
//            }
//        }
//    }
    
    // MARK: - .isLiked
    
    func isLiked(ownerID: Int, itemID: Int, completion: @escaping (LikesIsLikedResponse) -> Void) {
        
        let path = ".isLiked"
        let url = baseUrl + path
        
        guard let token = session.token else { return }
        guard let userID = session.userID else { return }
        
        let params: Parameters = [
            "user_id": userID,
            "type": "post",
            "item_id": itemID,
            "owner_id": ownerID,
            "access_token": token,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseData { response in
            guard let data = response.value else { return }
        
            do {
                let response = try JSONDecoder().decode(LikesIsLikedResult.self, from: data).response
                print(response)
                completion(response)
            } catch {
                print(error)
            }
        }
    }
}
