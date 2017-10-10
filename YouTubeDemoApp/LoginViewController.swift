//
//  LoginViewController.swift
//  YouTubeDemoApp
//
//  Created by Jimit Shah on 10/9/17.
//  Copyright © 2017 Jimit Shah. All rights reserved.
//

import UIKit
import GoogleSignIn
import Google

class LoginViewController: UIViewController {
  
  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    GIDSignIn.sharedInstance().uiDelegate = self
    GIDSignIn.sharedInstance().delegate = self
    
    let googleSignInButton = GIDSignInButton()
    googleSignInButton.center = view.center
    
    view.addSubview(googleSignInButton)
    
    // Uncomment to automatically sign in the user.
    //GIDSignIn.sharedInstance().signInSilently()
  }
  
  // Method to complete login after google authentication.
  private func completeLogin() {
    let controller = storyboard!.instantiateViewController(withIdentifier: "MasterNavigationController") as! UINavigationController
    self.present(controller, animated: true, completion: nil)
  }
  
}

// MARK: LoginViewController: GIDSignInUIDelegate, GIDSignInDelegate
extension LoginViewController: GIDSignInUIDelegate, GIDSignInDelegate {
  
  func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
              withError error: NSError!) {
    if (error == nil) {
      // Perform any operations on signed in user here.
      //      let userId = user.userID                  // For client-side use only!
      //      let idToken = user.authentication.idToken // Safe to send to the server
      //      let fullName = user.profile.name
      //      let givenName = user.profile.givenName
      //      let familyName = user.profile.familyName
      //      let email = user.profile.email
    } else {
      print("\(error.localizedDescription)")
    }
  }
  
  func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
    guard error == nil else {
      showAlert(nil, message: "Login Failed or Canceled by User.")
      //print("Error: Google Signin Failed.")
      return
    }
    showAlert("Success", message: "Welcome \(user.profile.name)", handler: {
      self.completeLogin()
    })
  }
  
}
