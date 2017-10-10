//
//  VideosTabBarControllerViewController.swift
//  YouTubeDemoApp
//
//  Created by Jimit Shah on 10/9/17.
//  Copyright © 2017 Jimit Shah. All rights reserved.
//

import UIKit
import GoogleSignIn

// MARK: VideosTabBarController: UITabBarController
class VideosTabBarController: UITabBarController {
  
  // MARK: Actions
  
  @IBAction func LogoutPressed(_ sender: Any) {
  
    GIDSignIn.sharedInstance().signOut()
    self.dismiss(animated: true, completion: nil)
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      // Disable tabbar if user have not search anything yet.
      self.tabBar.isUserInteractionEnabled = false
    }
  
}
