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
        return label
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: CellIdentifier.textCell.rawValue)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell setup
    
    private func setupConstraints() {
        contentView.addSubview(message)
        message.translatesAutoresizingMaskIntoConstraints = false
        message.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        message.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        message.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        message.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        guard let text = message.text else { return }
        message.heightAnchor.constraint(equalToConstant: text.height(withConstrainedWidth: message.frame.width, font: message.font)).isActive = true
    }
}
