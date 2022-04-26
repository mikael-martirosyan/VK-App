//
//  FullScreenPhotoController.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 22.04.2022.
//

import UIKit
import Alamofire

class FullScreenPhotoController: UICollectionViewController {
    
    // MARK: - Properties
    
    var photos = [PhotosGetAllItem]()
    var indexPath: IndexPath? = nil
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(FullScreenPhotoCell.self, forCellWithReuseIdentifier: CellIdentifier.fullScreenPhotoCell.rawValue)

        collectionView.isPagingEnabled = true

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
        
        let sizes = photos[indexPath.row].sizes
        
        for size in sizes {
            if size.type == "x" {
                if let url = URL(string: size.url) {
                    FetchImage.fetchImage(url: url) { image in
                        cell.photoImageView.image = image
                    }
                }
            }
        }
        
        return cell
    }
}
