//
//  FullScreenPhotoController + Extension.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 26.04.2022.
//

import UIKit

extension FullScreenPhotoController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let ratio: CGFloat = 16 / 9
        let width = collectionView.frame.width
        let height = width * ratio
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
