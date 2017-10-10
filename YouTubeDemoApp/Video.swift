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
  let url: String
  
  // MARK: Initializers
  init(dictionary: [String:AnyObject]) {
    videoID = dictionary["videoID"] as! String
    title = dictionary["title"] as! String
    url = dictionary["url"] as! String
  }
  
  static func videosFromResults(_ results: [[String:AnyObject]]) -> [Video] {
    var videos = [Video]()
    
    for result in results {
      
      let snippetDict = result[Client.JSONResponseKeys.Snippet] as! [String:AnyObject]
      
      var videosDict = [String:AnyObject]()
      videosDict["title"] = snippetDict[Client.JSONResponseKeys.Title]
      
      let thumbnailDict = snippetDict[Client.JSONResponseKeys.Tumbnail] as! [String:AnyObject]
      let defaultDict = thumbnailDict[Client.JSONResponseKeys.Default] as! [String:AnyObject]
      videosDict["url"] = defaultDict[Client.JSONResponseKeys.Url]
      
      let idDict = result[Client.JSONResponseKeys.Id] as! [String:AnyObject]
      videosDict["videoID"] = idDict[Client.JSONResponseKeys.VideoID]
      
      videos.append(Video(dictionary: videosDict))
    }
    
    return videos
  }
}
