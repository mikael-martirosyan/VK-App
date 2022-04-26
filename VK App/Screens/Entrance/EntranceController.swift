//
//  EntranceController.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 29.03.2022.
//

import UIKit

class EntranceController: UIViewController {
    
    // MARK: - Properties
    
    let vkTitle = UILabel()
    let login = UITextField()
    let password = UITextField()
    let enterBtn = UIButton()
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        setupProperties()
        setupConstraints()
        
        enterBtn.addTarget(self, action: #selector(enter), for: .touchUpInside)
    }
    
    // MARK: - Functions
    
    @objc private func enter() {
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true)
        
    }
}


