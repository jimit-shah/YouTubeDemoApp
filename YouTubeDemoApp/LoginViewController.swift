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


// MARK: LoginViewController: UIViewController

class LoginViewController: UIViewController {
  
  // MARK: Outlets
  
  @IBOutlet weak var appLabel: UILabel!
  
  @IBOutlet weak var stackView: UIStackView!
  // MARK: Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    appLabel.layer.cornerRadius = 10;
    appLabel.layer.masksToBounds = true;
    GIDSignIn.sharedInstance().uiDelegate = self
    GIDSignIn.sharedInstance().delegate = self
    
    let googleSignInButton = GIDSignInButton(frame: CGRect(x: 20, y: 100, width: 350, height: 45))
    googleSignInButton.layer.cornerRadius = 10;
    googleSignInButton.layer.masksToBounds = true;
    stackView.addArrangedSubview(googleSignInButton)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    self.view.addSubview(stackView)
    
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
    showAlert("Success", message: "Welcome \(user.profile.name!)!", handler: {
      self.completeLogin()
    })
  }
  
}
