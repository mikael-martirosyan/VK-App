//
//  Networking.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 12.05.2022.
//

import UIKit
import PromiseKit

/// Custom class
class Networking {
    
    static func fetchImage(url: URL, completion: @escaping (UIImage) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                #warning("Обработать ошибку")
                // Обработать ошибку
                print(error)
            } else if let data = data, let image = UIImage(data: data) {
                completion(image)
            }
        }.resume()
    }
    
    static func request/*<T: Decodable>*/(path: String, optionItems: [URLQueryItem], /*type: T,*/ completion: @escaping (/*T*/ Data?, Error?) -> Void) {
        
        let version = "5.131"
        
        guard let token = Session.shared.token else { return }
        
        let baseQueryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: version)
        ]
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method" + path
        components.queryItems = baseQueryItems + optionItems
        
        guard let componentsURL = components.url else { return }
        
        let urlRequest = URLRequest(url: componentsURL)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
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
        }.resume()
    }
    
    
    // MARK: - Получение изображения по ссылке с помощью PromiseKit
    
    // Fetching image with PromiseKit
    static func fetchImage(url: URL) -> Promise<UIImage> {
        return Promise<UIImage> { seal in
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    #warning("Обработать ошибку")
                    seal.reject(error)
                } else if let data = data, let image = UIImage(data: data) {
                    seal.fulfill(image)
                }
            }.resume()
        }
    }
}


