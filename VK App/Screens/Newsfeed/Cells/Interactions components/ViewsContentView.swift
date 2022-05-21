//
//  ViewsContentView.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 02.04.2022.
//

import UIKit

class ViewsContentView: UIView {
    
    // MARK: - Properties
    
    let viewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "eye.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray2
        imageView.backgroundColor = .systemBackground
        return imageView
    }()

    let viewsCount: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.backgroundColor = .systemBackground
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
    
    // MARK: - View setup

    private func setupConstaints() {
        addSubview(viewImageView)
        viewImageView.translatesAutoresizingMaskIntoConstraints = false
        viewImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        viewImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        viewImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        viewImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(viewsCount)
        viewsCount.translatesAutoresizingMaskIntoConstraints = false
        viewsCount.topAnchor.constraint(equalTo: topAnchor).isActive = true
        viewsCount.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        viewsCount.leadingAnchor.constraint(equalTo: viewImageView.trailingAnchor, constant: 3).isActive = true
        viewsCount.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        guard let text = viewsCount.text else { return }
        viewsCount.widthAnchor.constraint(equalToConstant: text.width(withConstrainedHeight: viewsCount.frame.height, font: viewsCount.font)).isActive = true
    }
}
