//
//  RepostsContentView.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 02.04.2022.
//

import UIKit

class RepostsControl: UIView {
    
    // MARK: - Properties
    
    let repostImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrowshape.turn.up.right")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray2
        return imageView
    }()

    let repostsCount: UILabel = {
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
        addSubview(repostImageView)
        repostImageView.translatesAutoresizingMaskIntoConstraints = false
        repostImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        repostImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        repostImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        repostImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(repostsCount)
        repostsCount.translatesAutoresizingMaskIntoConstraints = false
        repostsCount.topAnchor.constraint(equalTo: topAnchor).isActive = true
        repostsCount.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        repostsCount.leadingAnchor.constraint(equalTo: repostImageView.trailingAnchor, constant: 3).isActive = true
        repostsCount.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        guard let text = repostsCount.text else { return }
        repostsCount.widthAnchor.constraint(equalToConstant: text.width(withConstrainedHeight: repostsCount.frame.height, font: repostsCount.font)).isActive = true
    }
    
    // MARK: - Tracking setup
}
