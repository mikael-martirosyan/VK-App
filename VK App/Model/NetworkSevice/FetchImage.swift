//
//  FetchImage.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 26.04.2022.
//

import UIKit
import Alamofire

class FetchImage {
    
    static func fetchImage(url: URL, completion: @escaping (UIImage) -> Void) {
        AF.download(url).responseData { response in
            guard let data = response.value,
                  let image = UIImage(data: data)
            else { return }
        
            completion(image)
        }
    }
}
