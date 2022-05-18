//
//  TabBarController.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 29.03.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .systemBackground
        
        let newsfeedController = NewsfeedController()
        let friendsController = FriendsController()
        let groupsController = GroupsController()
        
        #warning("Создать перечисление для всех systemName в приложении")
        viewControllers = [createViewController(rootViewController: newsfeedController, title: Title.news.rawValue, image: UIImage(systemName: "newspaper")!),
                           createViewController(rootViewController: friendsController, title: Title.friends.rawValue, image: UIImage(systemName: "person.2.fill")!),
                           createViewController(rootViewController: groupsController, title: Title.groups.rawValue, image: UIImage(systemName: "person.3.fill")!)
        ]
    }
    
    // MARK: - Functions
    
    private func createViewController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        navigationController.navigationBar.backgroundColor = .systemBackground
        
        return navigationController
    }
}
