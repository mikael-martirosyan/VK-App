//
//  PhotosController.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 21.04.2022.
//

import UIKit

class PhotosController: UICollectionViewController {
    
    // MARK: - Properties
    
    private let networkService = PhotosNetworkService()
    var photos = [PhotosStruct]()
    
    let cellsPerRow: CGFloat = 3
    let insets = UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(PhotosCell.self, forCellWithReuseIdentifier: CellIdentifier.photosCell.rawValue)
    }
    
    // MARK: - UICollectionView data source
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.photosCell.rawValue, for: indexPath) as? PhotosCell else { return UICollectionViewCell() }
        
        let photo = photos[indexPath.item]
        
        DispatchQueue.global().async {
            if let url = URL(string: photo.url) {
                Networking.fetchImage(url: url) { image in
                    DispatchQueue.main.sync {
                        cell.photoImageView.image = image
                    }
                }
            }
        }
        
        return cell
    }
    
    // MARK: - CollectionView delegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let layout = UICollectionViewFlowLayout()
        let fullScreenPhotoVC = FullScreenPhotoController(collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        fullScreenPhotoVC.photos = photos
//        fullScreenPhotoVC.indexPath = indexPath
        navigationController?.pushViewController(fullScreenPhotoVC, animated: true)
    }
}
