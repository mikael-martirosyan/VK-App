//
//  UniversalTableViewCell.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 27.05.2022.
//

import UIKit

class UniversalTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    // add constants
    
    
    // MARK: - Properties
    
    let avatarImageView = VKRoundedImageView(image: nil)
    let nameLabel = VKNameLabel(fontSize: 17)
    
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
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        
        avatarImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.centerY.equalTo(contentView.snp.centerY)
            make.height.width.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).inset(10)
            make.centerY.equalTo(contentView.snp.centerY)
            make.height.equalTo(50)
        }
    }
}
