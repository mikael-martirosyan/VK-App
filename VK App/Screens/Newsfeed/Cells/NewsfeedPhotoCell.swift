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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: NewsfeedPhotoCell.reuseID)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell setup
    
    private func setupConstraints() {
        contentView.addSubview(photoImageView)
        
        photoImageView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(contentView)
        }
    }
    
    override func prepareForReuse() {
        photoImageView.image = nil
    }
}
