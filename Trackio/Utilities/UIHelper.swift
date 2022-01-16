//
//  UIHelper.swift
//  Trackio
//
//  Created by Harun Gunes on 16/01/2022.
//

import UIKit

class UIHelper {
  
  static func createOneColumnLayout(in view: UIView) -> UICollectionViewFlowLayout {
    
    let width = view.bounds.width
    let padding: CGFloat = 12
    let itemWidth = width - (padding * 3)
    
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth / 4)
    
    return flowLayout
  }
}
