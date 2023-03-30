//
//  TextCell.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 16.04.2022.
//

import UIKit

class TextCell: UITableViewCell {
    
    // MARK: - Properties
    
    let message: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.backgroundColor = .systemBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: TextCell.reuseID)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell setup
    
    private func setupConstraints() {
        contentView.addSubview(message)
        
        message.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(contentView).inset(UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10))
        }
    }
}
