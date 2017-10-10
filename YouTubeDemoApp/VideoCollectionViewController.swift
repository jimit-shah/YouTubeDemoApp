//
//  VideoCollectionViewController.swift
//  YouTubeDemoApp
//
//  Created by Jimit Shah on 10/9/17.
//  Copyright © 2017 Jimit Shah. All rights reserved.
//

import UIKit

class VideoCollectionViewController: UICollectionViewController {

  var videos: [Video]!
  
  let inset: CGFloat = 8.0
  let spacing: CGFloat = 8.0
  let lineSpacing: CGFloat = 4.0
  
  @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    self.collectionView?.collectionViewLayout.invalidateLayout()
  }
  
  func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func viewWillAppear(_ animated: Bool) {
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
  
  // cellForItemAt
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as! VideoCollectionViewCell
    let video = self.videos[(indexPath as NSIndexPath).row]
    cell.titleLabel.text = video.title
    
    let imagePath = video.url
      let _ = Client.sharedInstance().taskForGETImage(filePath: imagePath, completionHandlerForImage: { (imageData, error) in
        if let image = UIImage(data: imageData!) {
          performUIUpdatesOnMain {
            cell.imageView!.image = image
          }
        } else {
          print(error ?? "empty error")
        }
      })
    
    return cell
  }
  
  // MARK: DetailViewController
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let playVideoController = storyboard!.instantiateViewController(withIdentifier: "PlayVideoViewController") as! PlayVideoViewController
    
    playVideoController.video = self.videos[(indexPath as NSIndexPath).row]
    self.navigationController!.pushViewController(playVideoController, animated: true)
  }
  
  
  

}

