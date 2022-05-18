//
//  LikesNetworkService.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 12.04.2022.
//

import Foundation

class LikesNetworkService {
    
    private let method = "/likes"
    
//    typealias IsLiked = Int
    
    // MARK: - .add
    
//    func add(itemID: Int, accessKey: String, completion: @escaping (IsLiked) -> Void) {
//
//        let version = "5.131"
//
//        guard let token = Session.shared.token else { return }
//
//        let queryItems = [
//            URLQueryItem(name: "type", value: "post"),
//            URLQueryItem(name: "item_id", value: String(itemID)),
//            URLQueryItem(name: "access_key", value: accessKey),
//            URLQueryItem(name: "access_token", value: token),
//            URLQueryItem(name: "v", value: version)
//        ]
//
//        let path = method + ".add"
//
////        let methodQuertItems = [
////            URLQueryItem(name: "type", value: "post"),
////            URLQueryItem(name: "item_id", value: String(itemID))
////        ]
//
//        var components = URLComponents()
//        components.scheme = "https"
//        components.host = "api.vk.com"
//        components.path = "/method" + path
//        components.queryItems = queryItems
//
//        guard let componentsURL = components.url else { return }
//
//        let urlRequest = URLRequest(url: componentsURL)
//
//        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//            if let error = error {
//                print(error)
//            } else if let data = data {
//                print(String(data: data, encoding: .utf8))
//                do {
//                    let response = try JSONDecoder().decode(LikesAddResult.self, from: data).response
//                    completion(response.likes)
//                } catch {
//                    print(error)
//                }
//            }
//        }.resume()
    
    
    
    
    
    
        
//        Networking.request(path: path, optionItems: queryItems) { data, error in
//            if let error = error {
//                #warning("Обработать ошибки")
//                // Обработать ошибки
//                print(error)
//            } else if let data = data {
//                do {
//                    let response = try JSONDecoder().decode(LikesAddResult.self, from: data).response
//                    completion(response.likes)
//                } catch {
//                    fatalError("\(error)")
//                }
//            }
//        }
//    }
    
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
    
//    func isLiked(ownerID: Int, itemID: Int, completion: @escaping (LikesIsLikedResponse) -> Void) {
//
//        let path = method + ".isLiked"
//
//
//        guard let userID = Session.shared.userID else { return }
//
//        let methodQuertItems = [
//            URLQueryItem(name: "user_id", value: String(userID)),
//            URLQueryItem(name: "type", value: "post"),
//            URLQueryItem(name: "item_id", value: String(itemID)),
//            URLQueryItem(name: "owner_id", value: String(ownerID))
//        ]
//
//        Networking.request(path: path, optionItems: methodQuertItems) { data, error in
//            if let error = error {
//                #warning("Обработать ошибки")
//                // Обработать ошибки
//                print(error)
//            } else if let data = data {
//                do {
//                    let response = try JSONDecoder().decode(LikesIsLikedResult.self, from: data).response
//                    completion(response)
//                } catch {
//                    fatalError("\(error)")
//                }
//            }
//        }
//    }
}
