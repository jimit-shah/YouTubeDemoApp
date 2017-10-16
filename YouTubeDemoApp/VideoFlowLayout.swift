//
//  VideoFlowLayout.swift
//  YouTubeDemoApp
//
//  Created by Jimit Shah on 10/15/17.
//  Copyright © 2017 Jimit Shah. All rights reserved.
//

import UIKit

class VideoFlowLayout: UICollectionViewFlowLayout {

  let standardItemAlpha: CGFloat = 0.5
  let standardItemScale: CGFloat = 0.9
  
  override func prepare() {
    super.prepare()
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    let attributes = super.layoutAttributesForElements(in: rect)
    var attributesCopy = [UICollectionViewLayoutAttributes]()
    
    for itemAttributes in attributes! {
      
      let itemAttributesCopy = itemAttributes.copy() as! UICollectionViewLayoutAttributes
      
      changeLayoutAttributes(itemAttributesCopy)
      attributesCopy.append(itemAttributesCopy)
    }
    return attributesCopy
  }
  
  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
  
  func changeLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes) {
    let collectionCenter = collectionView!.frame.size.height/2
    let offset = collectionView!.contentOffset.y
    let normalizedCenter = attributes.center.y - offset
    
    let maxDistance = self.itemSize.height + self.minimumLineSpacing
    let distance = min(abs(collectionCenter - normalizedCenter), maxDistance)
    
    let ratio = (maxDistance - distance) / maxDistance
    let alpha = ratio * (1 - self.standardItemAlpha) + self.standardItemAlpha
    let scale = ratio * (1 -  self.standardItemScale) + self.standardItemScale
    
    attributes.alpha = alpha
    attributes.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
  }
  
}
