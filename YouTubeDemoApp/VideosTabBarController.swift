//
//  VideosTabBarControllerViewController.swift
//  YouTubeDemoApp
//
//  Created by Jimit Shah on 10/9/17.
//  Copyright © 2017 Jimit Shah. All rights reserved.
//

import UIKit
import GoogleSignIn

class VideosTabBarController: UITabBarController {

  
  // MARK: Actions
  
  @IBAction func LogoutPressed(_ sender: Any) {
  
    GIDSignIn.sharedInstance().signOut()
    self.dismiss(animated: true, completion: nil)
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.tabBar.isUserInteractionEnabled = false
    }
  
  
  
}
