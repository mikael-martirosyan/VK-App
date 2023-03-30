//
//  PhotosNetworkService.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 21.04.2022.
//

import UIKit
import PromiseKit

class PhotosNetworkService {
    
    private let method = "/photos"
    
    // MARK: - .getAll
    
    func getAll(ownerID: Int, photoType: PhotoTypeCases, completion: @escaping ([PhotosStruct]) -> Void) {
        
        let path = method + ".getAll"
        
        let methodQueryItems = [
            URLQueryItem(name: "owner_id", value: String(ownerID)),
            URLQueryItem(name: "count", value: "100"),
            URLQueryItem(name: "photo_sizes", value: "1")
        ]
        
        Networking.request(path: path, optionItems: methodQueryItems) { data, error in
            if let error = error {
                #warning("Обработать ошибки")
                // Обработать ошибки
                print(error)
            } else if let data = data {
                guard let photos = self.parseData(data: data, photoType: photoType) else { return }
                completion(photos)
            }
        }
    }
    
    private func parseData(data: Data, photoType: PhotoTypeCases) -> [PhotosStruct]? {
        do {
            let result = try JSONDecoder().decode(PhotosGetAllResult.self, from: data)
            
            var photos = [PhotosStruct]()
        
            for item in result.response.items {
                var photo = PhotosStruct(id: item.id, ownerID: item.ownerID, url: "", aspectRatio: 0)
                if let size = item.sizes.first(where: { $0.type == photoType.rawValue }) {
                    photo.url = size.url
                    photo.aspectRatio = CGFloat(size.height) / CGFloat(size.width)
                }
                photos.append(photo)
            }
            
            return photos
        } catch {
            print(error)
            return nil
        }
    }
}
