//
//  GroupsNetworkService.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 31.03.2022.
//

import Foundation
import Alamofire

class GroupsNetworkService {
    
    private let baseUrl = "https://api.vk.com/method/groups"
    private let session = Session.shared
    private let version = "5.131"
    
    // MARK: .get
    func get(completion: @escaping (GroupsGetResponse) -> Void) {
        
        let path = ".get"
        let url = baseUrl + path
        
        guard let token = session.token else { return }
        
        let params: Parameters = [
            "extended": 1,
            "fields": "name, photo_50",
            "access_token": token,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseData { response in
            guard let data = response.value else { return print("data error") }
            do {
                let response = try JSONDecoder().decode(GroupsGetResult.self, from: data).response
                completion(response)
            } catch {
                print(error)
            }
        }
    }
    
    // MARK: - .join
    func join(by id: Int) {
        
        let path = ".join"
        let url = baseUrl + path
        
        guard let token = session.token else { return }
        
        let params: Parameters = [
            "group_id": id,
            "access_token": token,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseData { response in
            guard let data = response.value else { return }
            
            do {
                let _ = try JSONDecoder().decode(GroupsJoinResult.self, from: data).response
            } catch {
                print(error)
            }
        }
    }
    
    // MARK: - .leave
    func leave(by id: Int) {
        
        let path = ".leave"
        let url = baseUrl + path
        
        guard let token = session.token else { return }
        
        let params: Parameters = [
            "group_id": id,
            "access_token": token,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseData { response in
            guard let data = response.value else { return }
            
            do {
                let _ = try JSONDecoder().decode(GroupsLeaveResult.self, from: data)
            } catch {
                print(error)
            }
        }
    }
    
    // MARK: - .search
    func search(request: String, completion: @escaping (GroupsSearchResponse) -> Void) {
        
        let path = ".search"
        let url = baseUrl + path
        
        guard let token = session.token else { return }
        
        let params: Parameters = [
            "q": request,
            "type": "group, page",
            "sort": 0, // по умолчанию
            "count": 50,
            "access_token": token,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseData { response in
            guard let data = response.value else { return }
            
            do {
                let response = try JSONDecoder().decode(GroupsSearchResult.self, from: data).response
                
                completion(response)
            } catch {
                print(error)
            }
        }
    }
}
