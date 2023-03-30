//
//  Extension + EntranceController.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 31.03.2022.
//

import UIKit
import SnapKit

extension EntranceController {
    
    // MARK: - Set up view
    
    func setupProperties() {
        vkTitle.text = "ВКонтакте"
        vkTitle.font = UIFont.systemFont(ofSize: 25)
        vkTitle.textColor = .blue
        vkTitle.textAlignment = .center
        vkTitle.translatesAutoresizingMaskIntoConstraints = false
        
        login.textAlignment = .natural
        login.textColor = .black
        login.font = UIFont.systemFont(ofSize: 13)
        login.clearButtonMode = .whileEditing
        login.placeholder = "Email or phone number"
        login.borderStyle = .roundedRect
        login.textContentType = .emailAddress
        login.keyboardType = .emailAddress
//        login.returnKeyType = .continue
        login.translatesAutoresizingMaskIntoConstraints = false
        
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
        password.translatesAutoresizingMaskIntoConstraints = false
        
        enterBtn.setTitle("Enter", for: .normal)
        enterBtn.backgroundColor = .blue
        enterBtn.tintColor = .systemPink
        enterBtn.layer.cornerRadius = 15
        enterBtn.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        view.addSubview(vkTitle)
//        vkTitle.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(100)
//            make.centerX.equalToSuperview()
//            make.height.equalToSuperview().inset(50)
//            make.width.equalToSuperview().inset(250)
//        }
        
        vkTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        vkTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        vkTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        vkTitle.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        view.addSubview(login)
        
        login.topAnchor.constraint(equalTo: vkTitle.bottomAnchor, constant: 100).isActive = true
        login.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        login.heightAnchor.constraint(equalToConstant: 50).isActive = true
        login.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(password)
        
        password.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 15).isActive = true
        password.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        password.heightAnchor.constraint(equalToConstant: 50).isActive = true
        password.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(enterBtn)
        
        enterBtn.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 30).isActive = true
        enterBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enterBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        enterBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}
