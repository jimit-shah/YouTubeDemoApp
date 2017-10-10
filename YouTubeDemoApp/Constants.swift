//
//  Constants.swift
//  YouTubeDemoApp
//
//  Created by Jimit Shah on 10/9/17.
//  Copyright © 2017 Jimit Shah. All rights reserved.
//

import Foundation

extension Client {
    
    // MARK: Constants
    struct Constants {
      
      // MARK: API Keys
      static let ApiKey = "AIzaSyAGZ0YBdo9MQoewpdcIZ9Ga1Zx5jwWYPkk"
      
      // MARK: URLs
      static let ApiScheme = "https"
      static let ApiHost = "www.googleapis.com"
      static let ApiPath = "youtube/v3"
      
      //https://www.googleapis.com/youtube/v3/search?part=apple&key={YOUR_API_KEY}
    }
    
    // MARK: Methods
    struct Methods {
      
      // MARK: Student Location
      static let Search = "/search"
    }
    
    // MARK: URL Keys
    struct URLKeys {
      static let UniqueKey = "uniqueKey"
      static let ObjectID = "objectId"
    }
    
    // MARK: Parameter Keys
    struct ParameterKeys {
      static let ApiKey = "key"
      static let Part = "part"
      static let Query = "q"
      static let ContentType = "type"
      static let Order = "order"
      static let MaxResult = "maxResults"
    }
  
    // MARK: JSON Response Keys
    struct JSONResponseKeys {
      
      // MARK: General
      static let StatusMessage = "status_message"
      static let StatusCode = "status_code"
      
      // MARK: Videos
      
      static let Items = "items"
      static let Id = "id"
      static let Snippet = "snippet"
      static let Title = "title"
      static let Tumbnail = "thumbnails"
      static let Url = "url"
      static let VideoID = "videoId"
      static let Default = "default"
      
    }

}
