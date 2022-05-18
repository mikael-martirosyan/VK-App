//
//  GroupsNetworkService.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 31.03.2022.
//

import Foundation
import PromiseKit

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
                guard let groups = self.parseData(data: data) else { return }
                completion(groups)
            }
        }
    }
    
    private func parseData(data: Data) -> GroupsGetResponse? {
        do {
            let response = try JSONDecoder().decode(GroupsGetResult.self, from: data).response
            return response
        } catch {
            fatalError("\(error)")
//            return nil
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
    
    
    // MARK: - Реализация метода /groups.get с помощью PromiseKit
    
    // Fetching data with PromiseKit
    func fetchData() -> Promise<Data> {
        return Promise<Data> { seal in
            
            let path = method + ".get"
            
            let methodQueryItems = [
                URLQueryItem(name: "extended", value: "1"),
                URLQueryItem(name: "fields", value: "name, photo_50")
            ]
            
            Networking.request(path: path, optionItems: methodQueryItems) { data, error in
                if let error = error {
                    seal.reject(error)
                } else if let data = data {
                    seal.fulfill(data)
                }
            }
        }
    }
    
    // Parsing data with PromiseKit
    func parseData(data: Data) -> Promise<GroupsGetResponse> {
        return Promise<GroupsGetResponse> { seal in
            do {
                let response = try JSONDecoder().decode(GroupsGetResult.self, from: data).response
                seal.fulfill(response)
            } catch {
                seal.reject(error)
            }
        }
    }
}
