//
//  Video.swift
//  YouTubeDemoApp
//
//  Created by Jimit Shah on 10/9/17.
//  Copyright © 2017 Jimit Shah. All rights reserved.
//

import Foundation

struct Video {
  
  let videoID: String
  let title: String
  let imageURL: String
  
  // MARK: Initializers
  init(dictionary: [String:AnyObject]) {
    videoID = dictionary[Client.JSONResponseKeys.VideoID] as! String
    title = dictionary[Client.JSONResponseKeys.Title] as! String
    imageURL = dictionary[Client.JSONResponseKeys.Url] as! String
  }
  
  static func videosFromResults(_ results: [[String:AnyObject]]) -> [Video] {
    var videos = [Video]()
    
    for result in results {
        videos.append(Video(dictionary: result))
    }
    
    return videos
  }
}
