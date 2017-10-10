//
//  VideosTabBarControllerViewController.swift
//  YouTubeDemoApp
//
//  Created by Jimit Shah on 10/9/17.
//  Copyright © 2017 Jimit Shah. All rights reserved.
//

import UIKit
import GoogleSignIn

class VideosTabBarControllerViewController: UITabBarController {

  @IBAction func LogoutPressed(_ sender: Any) {
    GIDSignIn.sharedInstance().signOut()
    self.dismiss(animated: true, completion: nil)
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
