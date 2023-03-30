//
//  VKTitleTableViewCell.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 23.03.2023.
//

import UIKit

class VKNameLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textColor = .black
        self.backgroundColor = .systemBackground
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(fontSize: CGFloat) {
        self.init()
        font = UIFont.systemFont(ofSize: fontSize)
    }

    convenience init(fontSize: CGFloat, weight: UIFont.Weight) {
        self.init()
        font = UIFont.systemFont(ofSize: fontSize, weight: weight)
    }
}
