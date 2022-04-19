//
//  InteractionsCell.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 16.04.2022.
//

import UIKit

class InteractionsCell: UITableViewCell {
    
    // MARK: - Properties
    
    let likesControl = LikesControl()
    let commentsControl = CommentsControl()
    let repostsControl = RepostsControl()
    let viewsContentView = ViewsContentView()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: CellIdentifier.interactionsCell.rawValue)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell setup
    
    private func setupConstraints() {
        addSubview(likesControl)
        likesControl.translatesAutoresizingMaskIntoConstraints = false
        likesControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        likesControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        likesControl.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(commentsControl)
        commentsControl.translatesAutoresizingMaskIntoConstraints = false
        commentsControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        commentsControl.leadingAnchor.constraint(equalTo: likesControl.trailingAnchor, constant: 10).isActive = true
        commentsControl.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(repostsControl)
        repostsControl.translatesAutoresizingMaskIntoConstraints = false
        repostsControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        repostsControl.leadingAnchor.constraint(equalTo: commentsControl.trailingAnchor, constant: 10).isActive = true
        repostsControl.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(viewsContentView)
        viewsContentView.translatesAutoresizingMaskIntoConstraints = false
        viewsContentView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        viewsContentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        viewsContentView.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
}
