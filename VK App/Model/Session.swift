//
//  Session.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 30.03.2022.
//

import Foundation

class Session {
    static var shared = Session()
    
    private init() {}
    
    #warning("Спрятать токен в KeyChain или UserDefault")
    var userID: String?
    var token: String?
}
