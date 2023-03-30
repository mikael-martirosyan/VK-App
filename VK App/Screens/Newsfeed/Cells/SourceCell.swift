//
//  SourceCell.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 16.04.2022.
//

import UIKit

class SourceCell: UITableViewCell {
    
    // MARK: - Properties
    
    let avatarImageView = VKRoundedImageView(image: nil)
    let nameLabel = VKNameLabel(fontSize: 15, weight: .medium)
    let dateLabel = VKNameLabel(fontSize: 12, weight: .semibold)
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: SourceCell.reuseID)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell setup
    
    private func setupConstraints() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        
        avatarImageView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.height.width.equalTo(35)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).inset(10)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.bottom.equalTo(contentView.snp.bottom).inset(10)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).inset(10)
        }
    }
}
