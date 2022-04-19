//
//  FooterContentView.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 02.04.2022.
//

import UIKit

//class FooterContentView: UIView {
//    
//    let likesControl = LikeControl()
//    let commentsContentView = CommentsControl()
//    let repostsContentView = RepostsContentView()
//    let viewsContentView = ViewsContentView()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//         
//        setupConstraints()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupConstraints() {
//        addSubview(likesControl)
//        likesControl.translatesAutoresizingMaskIntoConstraints = false
//        likesControl.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
//        likesControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
//        likesControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
//        likesControl.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        
//        addSubview(commentsContentView)
//        commentsContentView.translatesAutoresizingMaskIntoConstraints = false
//        commentsContentView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        commentsContentView.leadingAnchor.constraint(equalTo: likesControl.trailingAnchor, constant: 10).isActive = true
//        commentsContentView.heightAnchor.constraint(equalToConstant: 25).isActive = true
//        commentsContentView.widthAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
//        
//        addSubview(repostsContentView)
//        repostsContentView.translatesAutoresizingMaskIntoConstraints = false
//        repostsContentView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        repostsContentView.leadingAnchor.constraint(equalTo: commentsContentView.trailingAnchor, constant: 10).isActive = true
//        repostsContentView.heightAnchor.constraint(equalToConstant: 25).isActive = true
//        repostsContentView.widthAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
//        
//        addSubview(viewsContentView)
//        viewsContentView.translatesAutoresizingMaskIntoConstraints = false
//        viewsContentView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        viewsContentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
//        viewsContentView.heightAnchor.constraint(equalToConstant: 25).isActive = true
//        viewsContentView.widthAnchor.constraint(equalToConstant: 50).isActive = true
//    }
//}
