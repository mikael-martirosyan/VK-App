//
//  ParseFriendsDataOperation.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 13.05.2022.
//

import Foundation

class ParseFriendsDataOperation: Operation {
    
    var outputData: [FriendsGetItem]? = []
    
    override func main() {
        
        guard let fetchFriendsData = dependencies.first as? FetchFriendsDataOperation,
              let data = fetchFriendsData.data
        else { return }
        
        do {
            let result = try JSONDecoder().decode(FriendsGetResult.self, from: data)
            self.outputData = result.response.items
        } catch {
            #warning("Обработать ошибки")
            // Обработать ошибки
            print(error)
        }
    }
}
