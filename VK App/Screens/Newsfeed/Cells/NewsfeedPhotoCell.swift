//
//  NewsfeedPhotoCell.swift
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
        return imageView
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: CellIdentifier.newsfeedPhotoCell.rawValue)
        
        setupConstraints()
        
//        let width = contentView.frame.width
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell setup
    
    private func setupConstraints() {
        contentView.addSubview(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: contentView.frame.width * 16/9).isActive = true
    }
    
    override func prepareForReuse() {
        photoImageView.image = nil
    }
}
