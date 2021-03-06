//
//  MasterCollectionViewController.swift
//  YouTubeDemoApp
//
//  Created by Jimit Shah on 10/14/17.
//  Copyright © 2017 Jimit Shah. All rights reserved.
//

import UIKit

class MasterCollectionViewController: UICollectionViewController {
  // MARK: Properties
  
  var videos: [Video]!
  
//  Implementing custom flow layout
//  let columns: CGFloat = 1.0
  let inset: CGFloat = 8.0
  let spacing: CGFloat = 0
  let lineSpacing: CGFloat = 8.0

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Code when using VideoCollectionViewCell
    // using standard collection view flow layout
    //let width = collectionView!.frame.width / 1
    //let layout = collectionViewLayout as! UICollectionViewFlowLayout
    //layout.itemSize = CGSize(width: width, height: width)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // Refresh Control
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(MasterCollectionViewController.refreshControlDidFire), for: .valueChanged)
    collectionView?.refreshControl = refreshControl
    
    // Initial Flow Layout Setup
    let layout = collectionViewLayout as! VideoFlowLayout
    let standardItemSize = layout.itemSize.width * layout.standardItemScale
    layout.estimatedItemSize = CGSize(width: standardItemSize, height: standardItemSize)
    layout.minimumLineSpacing = lineSpacing
    layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    layout.minimumInteritemSpacing = spacing
    
  }
  
  @objc func refreshControlDidFire() {
    collectionView?.reloadData()
    collectionView?.refreshControl?.endRefreshing()
  }
}

// MARK: UICollectionViewDataSource
extension MasterCollectionViewController {
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return videos.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderView
    sectionHeaderView.title = "Videos"
    return sectionHeaderView
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! VideoCollectionViewCell
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! RoundedVideoCell
    
    
    let video = self.videos[(indexPath as NSIndexPath).row]
    
    cell.video = video
    return cell
  }
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    self.collectionView?.collectionViewLayout.invalidateLayout()
  }
}

/*
// MARK: UICollectionViewDeligateFlowLayout
extension MasterCollectionViewController: UICollectionViewDelegateFlowLayout{

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


    let width = Int((collectionView.frame.width / columns) - (inset + spacing))

    return CGSize(width: width, height: width)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return spacing
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return lineSpacing
  }
}
*/
