//
//  Extension + EntranceController.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 31.03.2022.
//

import UIKit

extension EntranceController {
    
    // MARK: - Set up view
    
    func setupProperties() {
        vkTitle.text = "ВКонтакте"
        vkTitle.font = UIFont.systemFont(ofSize: 25)
        vkTitle.textColor = .blue
        vkTitle.textAlignment = .center
        
        login.textAlignment = .natural
        login.textColor = .black
        login.font = UIFont.systemFont(ofSize: 13)
        login.clearButtonMode = .whileEditing
        login.placeholder = "Email or phone number"
        login.borderStyle = .roundedRect
        login.textContentType = .emailAddress
        login.keyboardType = .emailAddress
//        login.returnKeyType = .continue
        
        password.textAlignment = .natural
        password.textColor = .black
        password.font = UIFont.systemFont(ofSize: 13)
        password.clearButtonMode = .whileEditing
        password.placeholder = "Password"
        password.borderStyle = .roundedRect
        password.textContentType = .password
        password.isSecureTextEntry = true
//        password.returnKeyType = .go
        password.tintColor = .blue
        
        enterBtn.setTitle("Enter", for: .normal)
        enterBtn.backgroundColor = .blue
        enterBtn.tintColor = .systemPink
        enterBtn.layer.cornerRadius = 15
    }
    
    func setupConstraints() {
        view.addSubview(vkTitle)
        vkTitle.translatesAutoresizingMaskIntoConstraints = false
        vkTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        vkTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        vkTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        vkTitle.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        view.addSubview(login)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.topAnchor.constraint(equalTo: vkTitle.bottomAnchor, constant: 100).isActive = true
        login.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        login.heightAnchor.constraint(equalToConstant: 50).isActive = true
        login.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(password)
        password.translatesAutoresizingMaskIntoConstraints = false
        password.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 15).isActive = true
        password.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        password.heightAnchor.constraint(equalToConstant: 50).isActive = true
        password.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(enterBtn)
        enterBtn.translatesAutoresizingMaskIntoConstraints = false
        enterBtn.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 30).isActive = true
        enterBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enterBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        enterBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}
