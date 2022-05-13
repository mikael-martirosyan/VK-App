//
//  Networking.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 12.05.2022.
//

import UIKit

/// Custom class
class Networking {
    
    static func fetchImage(url: URL, completion: @escaping (UIImage) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, _, error in
            if let error = error {
                #warning("Обработать ошибку")
                // Обработать ошибку
                print(error)
            } else if let data = data, let image = UIImage(data: data) {
                completion(image)
            }
        }
        task.resume()
    }
    
    static func request/*<T: Decodable>*/(path: String, optionItems: [URLQueryItem], /*type: T,*/ completion: @escaping (/*T*/ Data?, Error?) -> Void) {
        
        let version = "5.131"
        let session = Session.shared
        
        guard let token = session.token else { return }
        
        let baseQueryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: version)
        ]
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method" + path
        urlComponents.queryItems = baseQueryItems + optionItems
        
        guard let componentsURL = urlComponents.url else { return }
        
        let urlRequest = URLRequest(url: componentsURL)
        
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                completion(nil, error)
            } else if let data = data {
//                do {
//                    guard let type = type as? T.Type else { return }
//                    let result = try JSONDecoder().decode(type.self, from: data)
//                    completion(result, nil)
//                } catch {
//                    print(error)
//                }
                completion(data, nil)
            }
        }
        task.resume()
    }
}


