//
//  SearchViewController.swift
//  YouTubeDemoApp
//
//  Created by Jimit Shah on 10/9/17.
//  Copyright © 2017 Jimit Shah. All rights reserved.
//

import UIKit

// MARK: SearchViewController: UIViewController
class SearchViewController: UIViewController {
  
  // MARK: Properties
  
  var videos: [Video]!
  var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
  
  // MARK: Outlets
  
  @IBOutlet weak var searchTextField: UITextField!
  @IBOutlet weak var searchButton: UIButton!
 
  // MARK: Lifecycle
  
  @IBAction func searchPressed(_ sender: Any) {
    refreshData()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // configure UI
    configure()
    
  }
  
  func configure() {
    searchTextField.delegate = self
  }
  
  
  // Function to load/refresh data
  func refreshData() {
    
    startActivityIndicator(for: self, activityIndicator, .whiteLarge)
    
    let collectionViewController = self.tabBarController?.viewControllers![1] as! VideoCollectionViewController
    
    Client.sharedInstance().getSearchVideos(searchTextField.text!) { (videos, error) in
      if let videos  = videos {
        collectionViewController.videos = videos
        performUIUpdatesOnMain {
          self.stopActivityIndicator(for: self, self.activityIndicator)
          collectionViewController.refreshData()
          self.tabBarController?.selectedIndex = 1
          self.tabBarController?.tabBar.isUserInteractionEnabled = true
        }
        
      } else {
        performUIUpdatesOnMain {
          self.stopActivityIndicator(for: self, self.activityIndicator)
          self.showAlert("No Vidoe Found", message: (error?.localizedDescription)!)
        }
        
      }
    }
  }
}

// MARK: UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
  
  // Hide keyboard on pressing return
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
}
