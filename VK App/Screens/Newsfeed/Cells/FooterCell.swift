//
//  FooterCell.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 10.05.2022.
//

import UIKit

class FooterCell: UITableViewCell {
    
    private let footerView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: FooterCell.reuseID)
        
        footerView.backgroundColor = .gray
        footerView.alpha = 0.1
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        contentView.addSubview(footerView)
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        footerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        footerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        footerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//        footerView.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
}
