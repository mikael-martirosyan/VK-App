//
//  ImagesCell.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 18.04.2022.
//

import UIKit

class NewsfeedPhotoCell: UITableViewCell {
    
    // MARK: - Properties

    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: CellIdentifier.newsfeedPhotoCell.rawValue)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell setup
    
    private func setupConstraints() {
        addSubview(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
//        photoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        photoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        photoImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        photoImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
