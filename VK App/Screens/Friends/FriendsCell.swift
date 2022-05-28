//
//  FriendsCell.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 29.03.2022.
//

import UIKit

class FriendsCell: UITableViewCell {
    
    // MARK: - Properties
    
    let avatar: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemBackground
        return imageView
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17)
        label.backgroundColor = .systemBackground
        return label
    }()
    
    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell setup
    
    private func setupConstraints() {
        contentView.addSubview(avatar)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        avatar.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: 50).isActive = true
    
        contentView.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10).isActive = true
        name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        name.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        name.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatar.layer.cornerRadius = avatar.frame.width / 2
    }
}
