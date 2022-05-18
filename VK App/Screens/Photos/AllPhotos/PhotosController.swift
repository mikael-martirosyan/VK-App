//
//  PhotosController.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 21.04.2022.
//

import UIKit
import PromiseKit
import SDWebImage

class PhotosController: UICollectionViewController {
    
    // MARK: - Properties
    
    private let networkService = PhotosNetworkService()
    var ownerID = 0
    var photos = [PhotosStruct]()
    
    let cellsPerRow: CGFloat = 3
    let insets = UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(PhotosCell.self, forCellWithReuseIdentifier: CellIdentifier.photosCell.rawValue)
        
        DispatchQueue.global().async {
            self.networkService.getAll(ownerID: self.ownerID, photoType: PhotoTypeCases.q) { [weak self] photos in
                guard let self = self else { return }
                self.photos = photos
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    // MARK: - UICollectionView data source
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.photosCell.rawValue, for: indexPath) as? PhotosCell else { return UICollectionViewCell() }
        
        let photo = photos[indexPath.item]
        
//        cell.photoImageView.image = nil
    
//        DispatchQueue.global().async {
//            if let url = URL(string: photo.url) {
//                Networking.fetchImage(url: url) { image in
//                    DispatchQueue.main.sync {
//                        cell.photoImageView.image = image
//                    }
//                }
//            }
//        }
        
        
        // SDWebImage
        guard let url = URL(string: photo.url) else { return cell }
        
        cell.photoImageView.sd_setImage(with: url)
        
        return cell
    }
    
    // MARK: - CollectionView delegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let fullScreenPhotoVC = FullScreenPhotoController(collectionViewLayout: layout)
        
//        fullScreenPhotoVC.photos = photos
//        fullScreenPhotoVC.indexPath = indexPath
        fullScreenPhotoVC.ownerID = ownerID
        
        navigationController?.pushViewController(fullScreenPhotoVC, animated: true)
    }
}
