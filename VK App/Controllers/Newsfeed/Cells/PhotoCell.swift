//
//  ImagesCell.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 18.04.2022.
//

import UIKit

class PhotoCell: UITableViewCell {
    
    // MARK: - Properties

    let photo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: CellIdentifier.photoCell.rawValue)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell setup
    
    private func setupConstraints() {
        addSubview(photo)
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        photo.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        photo.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
