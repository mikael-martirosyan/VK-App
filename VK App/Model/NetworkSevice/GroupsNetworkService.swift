//
//  GroupsNetworkService.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 31.03.2022.
//

import Foundation

enum GruopsMethods: String {
    case join
    case leave
}

class GroupsNetworkService {
    
    private let method = "/groups"
    
    // MARK: - .get
    func get(completion: @escaping (GroupsGetResponse) -> Void) {
        
        let path = method + ".get"
        
        let methodQueryItems = [
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "fields", value: "name, photo_50")
        ]
        
        Networking.request(path: path, optionItems: methodQueryItems) { data, error in
            if let error = error {
                #warning("Обработать ошибки")
                // Обработать ошибки
                print(error)
            } else if let data = data {
                do {
                    let response = try JSONDecoder().decode(GroupsGetResult.self, from: data).response
                    completion(response)
                } catch {
                    fatalError("\(error)")
                }
            }
        }
    }
    
    // MARK: - .join
    func join(by id: Int) {
        
        let path = method + ".join"
        
        let methodQueryItems = [
            URLQueryItem(name: "group_id", value: String(id)),
            URLQueryItem(name: "fields", value: "name, photo_50")
        ]
        
        Networking.request(path: path, optionItems: methodQueryItems) { data, error in
            if let error = error {
                #warning("Обработать ошибки")
                // Обработать ошибки
                print(error)
            } else if let data = data {
                do {
                    let _ = try JSONDecoder().decode(GroupsJoinResult.self, from: data).response
                } catch {
                    fatalError("\(error)")
                }
            }
        }
    }
    
    // MARK: - .leave
    func leave(by id: Int) {
        
        let path = ".leave"
        
        let methodQueryItems = [
            URLQueryItem(name: "group_id", value: String(id)),
        ]
        
        Networking.request(path: path, optionItems: methodQueryItems) { data, error in
            if let error = error {
                #warning("Обработать ошибки")
                // Обработать ошибки
                print(error)
            } else if let data = data {
                do {
                    let _ = try JSONDecoder().decode(GroupsLeaveResult.self, from: data)
                } catch {
                    fatalError("\(error)")
                }
            }
        }
    }
    
    // MARK: - .search
    func search(request: String, completion: @escaping (GroupsSearchResponse) -> Void) {
        
        let path = method + ".search"
        
        let methodQueryItems = [
            URLQueryItem(name: "q", value: request),
            URLQueryItem(name: "type", value: "group, page"),
            URLQueryItem(name: "sort", value: "0"), // по умолчанию
            URLQueryItem(name: "count", value: "50")
        ]
        
        Networking.request(path: path, optionItems: methodQueryItems) { data, error in
            if let error = error {
                #warning("Обработать ошибки")
                // Обработать ошибки
                print(error)
            } else if let data = data {
                do {
                    let response = try JSONDecoder().decode(GroupsSearchResult.self, from: data).response
                    
                    completion(response)
                } catch {
                    #warning("Обработать ошибки")
                    // Обработать ошибки
                    print(error)
                }
            }
        }
    }
}
