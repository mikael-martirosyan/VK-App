//
//  SourceCell.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 16.04.2022.
//

import UIKit

class SourceCell: UITableViewCell {
    
    // MARK: - Properties
    
    let avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    let date: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: CellIdentifier.sourceCell.rawValue)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell setup
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatar.layer.cornerRadius = avatar.frame.width / 2
    }
    
    private func setupConstraints() {
        addSubview(avatar)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        avatar.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
//        avatar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        avatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: 35).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        name.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10).isActive = true
        name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
        addSubview(date)
        date.translatesAutoresizingMaskIntoConstraints = false
        date.topAnchor.constraint(equalTo: name.bottomAnchor).isActive = true
        date.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        date.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10).isActive = true
        date.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
}
