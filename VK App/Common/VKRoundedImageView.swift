//
//  VKRoundedImageView.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 22.03.2023.
//

import UIKit

class VKRoundedImageView: UIImageView {
    override init(image: UIImage?) {
        super.init(image: image)
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
        self.backgroundColor = .systemBackground
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.height / 2
    }
}
