//
//  NewsfeedCell.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 30.03.2022.
//

import UIKit

//class NewsfeedCell: UITableViewCell {
//
//    let headerContentView = HeaderContentView()
//    let footerContentView = FooterContentView()
//
//    let newsText: UITextView = {
//        let textView = UITextView()
//        textView.textColor = .black
//        textView.font = UIFont.systemFont(ofSize: 15)
//        return textView
//    }()
//
//    let newsImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "person")
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        setupConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupConstraints() {
//        contentView.addSubview(headerContentView)
//        headerContentView.translatesAutoresizingMaskIntoConstraints = false
//        headerContentView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        headerContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//        headerContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//        headerContentView.heightAnchor.constraint(equalToConstant: 70).isActive = true
//
//        contentView.addSubview(newsText)
//        newsText.translatesAutoresizingMaskIntoConstraints = false
//        newsText.topAnchor.constraint(equalTo: headerContentView.bottomAnchor).isActive = true
//        newsText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
//        newsText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
//        let heightConstraint = newsText.heightAnchor.constraint(equalToConstant: 100)
//        heightConstraint.isActive = true
//        heightConstraint.priority = UILayoutPriority(rawValue: 900)
//
//
//        contentView.addSubview(newsImage)
//        newsImage.translatesAutoresizingMaskIntoConstraints = false
//        newsImage.topAnchor.constraint(equalTo: newsText.bottomAnchor, constant: 10).isActive = true
//        newsImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//        newsImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//        newsImage.heightAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
//
//        contentView.addSubview(footerContentView)
//        footerContentView.translatesAutoresizingMaskIntoConstraints = false
//        footerContentView.topAnchor.constraint(equalTo: newsImage.bottomAnchor).isActive = true
//        footerContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//        footerContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//        footerContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//        footerContentView.heightAnchor.constraint(equalToConstant: 45).isActive = true
//    }
//}
