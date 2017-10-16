//
//  RoundedVideoCell.swift
//  YouTubeDemoApp
//
//  Created by Jimit Shah on 10/15/17.
//  Copyright © 2017 Jimit Shah. All rights reserved.
//

import UIKit
import WebKit

class RoundedVideoCell: UICollectionViewCell {
  @IBOutlet weak var webView: WKWebView!
  @IBOutlet weak var videoTitle: UILabel!
  
  var video: Video? {
    didSet {
      if let theVideo = video {
        let url = URL(string: "https://www.youtube.com/embed/\(theVideo.videoID)")
        videoTitle.text = theVideo.title
        webView.load(URLRequest(url: url!))
      }
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.layer.cornerRadius = self.frame.size.width * 0.125
    self.layer.borderWidth = 6
    self.layer.borderColor = UIColor(red: 0.5, green: 0.47, blue: 0.25, alpha: 1.0).cgColor
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    webView.stopLoading()
    videoTitle.text = ""
  }
}
