//
//  VideoCollectionViewController.swift
//  YouTubeDemoApp
//
//  Created by Jimit Shah on 10/9/17.
//  Copyright © 2017 Jimit Shah. All rights reserved.
//
// Note: Not being used (replaced by MasterCollectionViewController)
import UIKit
import WebKit

// MARK: VideoCollectionViewController: UICollectionViewController
class VideoCollectionViewController: UICollectionViewController {

  // MARK: Properties
  
  var videos: [Video]!
  let inset: CGFloat = 8.0
  let spacing: CGFloat = 8.0
  let lineSpacing: CGFloat = 4.0
  
  // MARK: Outlets
  
  @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

  // MARK: Lifecycle
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    self.collectionView?.collectionViewLayout.invalidateLayout()
  }
  
  func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    refreshData()
  }
  

  // Reload data in collection view
  func refreshData() {
  collectionView?.reloadData()
  }
  
  // MARK: Collection View Data Source
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.videos.count
  }
  
  // MARK: cellForItemAt
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as! VideoCollectionViewCell
    let video = self.videos[(indexPath as NSIndexPath).row]
    
    // We can also use titles if needed
    //cell.titleLabel.text = video.title
    
    let url = URL(string: "https://www.youtube.com/embed/\(video.videoID)")
    addRoundedEdge(to: cell.webView)
    //cell.webView.layer.cornerRadius = 10;
    //cell.webView.layer.masksToBounds = true;
    cell.webView.load(URLRequest(url: url!))
    
    return cell
  }

}

