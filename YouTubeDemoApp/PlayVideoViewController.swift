//
//  PlayVideoViewController.swift
//  YouTubeDemoApp
//
//  Created by Jimit Shah on 10/10/17.
//  Copyright © 2017 Jimit Shah. All rights reserved.
//

import Foundation
import UIKit

class PlayVideoViewController: UIViewController {
  
  
  // MARK: Properties
  
  var video: Video!
  
  // MARK: Outlets
  @IBOutlet weak var imageView: UIImageView!
  
  // MARK: Lifecycle
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    self.tabBarController?.tabBar.isHidden = true
    //self.imageView!.image = video.videoID // get video to play using video id
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.tabBarController?.tabBar.isHidden = false
  }
  
  // PopToRootViewController
  func startOver() {
    if let navigationController = self.navigationController {
      navigationController.popToRootViewController(animated: true)
    }
  }
  
}
