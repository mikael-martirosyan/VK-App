//
//  FullScreenPhotoController + Extension.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 26.04.2022.
//

import UIKit

extension FullScreenPhotoController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        return CGSize(width: width, height: CGFloat.calculateHeight(width: width))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
