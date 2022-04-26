//
//  CommentsContentView.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 02.04.2022.
//

import UIKit

class CommentsControl: UIControl {
    
    // MARK: - Properties
    
    let commentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bubble.left")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray2
        return imageView
    }()
    
    let commentsCount: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Control setup
    
    private func setupConstaints() {
        addSubview(commentImageView)
        commentImageView.translatesAutoresizingMaskIntoConstraints = false
        commentImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        commentImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        commentImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        commentImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(commentsCount)
        commentsCount.translatesAutoresizingMaskIntoConstraints = false
        commentsCount.topAnchor.constraint(equalTo: topAnchor).isActive = true
        commentsCount.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        commentsCount.leadingAnchor.constraint(equalTo: commentImageView.trailingAnchor, constant: 3).isActive = true
        commentsCount.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        guard let text = commentsCount.text else { return }
        commentsCount.widthAnchor.constraint(equalToConstant: text.width(withConstrainedHeight: commentsCount.frame.height, font: commentsCount.font)).isActive = true
    }
    
    // MARK: - Tracking setup
}
