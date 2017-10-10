//
//  Convenience.swift
//  YouTubeDemoApp
//
//  Created by Jimit Shah on 10/9/17.
//  Copyright © 2017 Jimit Shah. All rights reserved.
//

import Foundation


extension Client {
  
  //MARK: GET Search Videos Convenient Method
  func getSearchVideos(_ userText: String, _ completionHandlerForSearchVideos: @escaping (_ result: [Video]?, _ error: NSError?) -> Void) {
    
//    var parametersWithKeys = [String:AnyObject]()
//    parametersWithKeys[ParameterKeys.Part] = "snippet" as AnyObject?
//    parametersWithKeys[ParameterKeys.ApiKey] = Constants.ApiKey as AnyObject?
//    //parametersWithKeys[ParameterKeys.Where] = "{\"uniqueKey\":\"\(userID)\"}" as AnyObject?
//    parametersWithKeys[ParameterKeys.Query] = userText as AnyObject?
//    parametersWithKeys[ParameterKeys.ContentType] = "video" as AnyObject?
//    parametersWithKeys[ParameterKeys.Order] = "relevance" as AnyObject
//    //parametersWithKeys[ParameterKeys.MaxResult] = 25 as AnyObject
//
    
    let _ = taskForGETMethod(Methods.Search, userText) { (results, error) in
      if let error = error {
        completionHandlerForSearchVideos(nil, error)
      } else {
        if let results = results {
          let items = results[Client.JSONResponseKeys.Items] as! [[String:AnyObject]]
          let videos = Video.videosFromResults(items)
          print("Videos: \(videos)")
          completionHandlerForSearchVideos(videos, nil)
        } else {
          completionHandlerForSearchVideos(nil, NSError(domain: "getSearchVideos parsing", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse getSearchVideos"]))
        }
      }
    }
  }
  
}
