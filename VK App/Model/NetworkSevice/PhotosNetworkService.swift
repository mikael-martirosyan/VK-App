//
//  PhotosNetworkService.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 21.04.2022.
//

import Foundation
import Alamofire

class PhotosNetworkService {
    
    private let baseURL = "https://api.vk.com/method/photos"
    private let session = Session.shared
    private let version = "5.131"
    
    // MARK: - .getAll
    
    func getAll(ownerID: Int, completion: @escaping ([PhotosGetAllItem]) -> Void) {
        
        let path = ".getAll"
        let url = baseURL + path
        
        guard let token = session.token else { return }
        
        let params: Parameters = [
            "owner_id": ownerID,
            "count": 100,
            "photo_sizes": 1,
            "access_token": token,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseData { response in
            guard let data = response.value else { return }
            
            do {
                let response = try JSONDecoder().decode(PhotosGetAllResult.self, from: data).response
                
                completion(response.items)
            } catch {
                print(error)
            }
        }
    }
}
