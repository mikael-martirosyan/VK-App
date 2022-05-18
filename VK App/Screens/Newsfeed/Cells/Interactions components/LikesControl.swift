//
//  LikeControl.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 02.04.2022.
//

import UIKit

//protocol LikeControlDelegate: AnyObject {
//    func checkLiked()
//}

class LikesControl: UIControl {
    
//    weak var delegate: LikeControlDelegate?
    
    // MARK: - Properties
    
    let likeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let likesCount: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    let likesNetworkService = LikesNetworkService()
    
    var isLiked = 2
    var itemID = 0
    var accessKey = ""
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            
        setupContstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Control setup
    
    private func setupContstaints() {
        addSubview(likeImageView)
        likeImageView.translatesAutoresizingMaskIntoConstraints = false
        likeImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        likeImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        likeImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        likeImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(likesCount)
        likesCount.translatesAutoresizingMaskIntoConstraints = false
        likesCount.topAnchor.constraint(equalTo: topAnchor).isActive = true
        likesCount.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        likesCount.leadingAnchor.constraint(equalTo: likeImageView.trailingAnchor, constant: 3).isActive = true
        likesCount.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        guard let text = likesCount.text else { return }
        likesCount.widthAnchor.constraint(equalToConstant: text.width(withConstrainedHeight: likesCount.frame.height, font: likesCount.font)).isActive = true
    }
    
    // MARK: - Tracking setup
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        #warning("Доделать добавление лайка")
        
//        if isLiked == 0 {
//            likesNetworkService.add(itemID: itemID, accessKey: accessKey) { [weak self] like in
//                guard let self = self else { return }
//                self.isLiked = like
//                DispatchQueue.main.sync {
//                    self.likeImageView.image = UIImage(systemName: "heart.fill")
//                    self.likeImageView.tintColor = .red
//
//                    let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
//                    impactGenerator.impactOccurred()
//                }
//            }
//        } else if isLiked == 1 {
//            print("Like deleted")
//            isLiked = 0
//            let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
//            impactGenerator.impactOccurred()
//        }
    }
}
