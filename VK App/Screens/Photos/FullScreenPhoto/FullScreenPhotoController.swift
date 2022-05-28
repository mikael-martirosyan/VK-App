//
//  FullScreenPhotoController.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 22.04.2022.
//

import UIKit

class FullScreenPhotoController: UICollectionViewController {
    
    // MARK: - Properties
    
    private let networkService = PhotosNetworkService()
    var photos = [PhotosStruct]()
    var ownerID = 0
//    var indexPath: IndexPath? = nil
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(FullScreenPhotoCell.self, forCellWithReuseIdentifier: CellIdentifier.fullScreenPhotoCell.rawValue)

        collectionView.isPagingEnabled = true
        
        DispatchQueue.global().async {
            self.networkService.getAll(ownerID: self.ownerID, photoType: PhotoTypeCases.x) { photos in
                self.photos = photos
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }

        #warning("Исправить работу функции и проверить, почему ImageView показывается выше, до скролла")
//        collectionView.performBatchUpdates(nil) { [weak self] _ in
//            print("OK")
//            guard let self = self,
//                  let indexPath = self.indexPath
//            else { return }
//
//            self.collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
//        }
    }

    // MARK: - UICollectionView data source

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.fullScreenPhotoCell.rawValue, for: indexPath) as? FullScreenPhotoCell else { return UICollectionViewCell() }
        
        let photo = photos[indexPath.item]
        
        DispatchQueue.global().async {
            if let url = URL(string: photo.url) {
                Networking.fetchImage(url: url) { image in
                    DispatchQueue.main.async {
                        cell.photoImageView.image = image
                    }
                }
            }
        }
        
        return cell
    }
}
