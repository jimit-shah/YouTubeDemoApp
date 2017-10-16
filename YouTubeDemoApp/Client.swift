//
//  Client.swift
//  YouTubeDemoApp
//
//  Created by Jimit Shah on 10/9/17.
//  Copyright © 2017 Jimit Shah. All rights reserved.
//

import UIKit

class Client: NSObject {

  // MARK: - Properties
  
  // shared session
  var session = URLSession.shared
  
  // MARK: - Initializers
  
  override init() {
    super.init()
  }
  
  // MARK: GET
  
  func taskForGETMethod(_ method: String, _ searchText: String, completionHandlerForGET: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) -> URLSessionDataTask {
    
    //let parametersWithKeys = parameters
    let formattedText = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    
    // 2/3. Build the URL, Configure the request
    //let request = NSMutableURLRequest(url: urlFromParameters(parametersWithKeys, withPathExtension: method))
    let urlString = "https://www.googleapis.com/youtube/v3/search?part=snippet&key=AIzaSyAGZ0YBdo9MQoewpdcIZ9Ga1Zx5jwWYPkk&q=\(formattedText!)&type=video"
    
    let request = NSMutableURLRequest(url: NSURL(string: urlString)! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    request.httpMethod = "GET"
    
    // 4. Make the requeset
    let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
      
      func sendError(_ error: String) {
        print(error)
        let userInfo = [NSLocalizedDescriptionKey : error]
        completionHandlerForGET(nil, NSError(domain: "taskForGETMethod", code: 1, userInfo: userInfo))
      }
      
      // GUARD: Was there an error?
      guard (error == nil) else {
        sendError("There was an error with your request: \(error!)")
        return
      }
      
      // GUARD: Did we get a successful 2XX response?
      guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
        sendError("Your request returned a status code other than 2xx!")
        return
      }
      
      // GUARD: Was there any data returned?
      guard let data = data else {
        sendError("No data was returned by the GET request!")
        return
      }
      
      // 5/6. Parse the data and use the data (happens in completion handler)
      self.convertDataWithCompletionHandler(data, completionHandlerForConvertData: completionHandlerForGET)
    }
    
    // 7. Start the request
    task.resume()
    return task
  }
 
  // GET Thumbnail
  func taskForGETImage(filePath: String, completionHandlerForImage: @escaping (_ imageData: Data?, _ error: NSError?) -> Void) -> URLSessionTask {
    
    let url = URL(string: filePath)!
    let request = URLRequest(url: url)
    
    let task = session.dataTask(with: request) { (data, response, error) in
      
      func sendError(_ error: String) {
        print(error)
        let userInfo = [NSLocalizedDescriptionKey : error]
        completionHandlerForImage(nil, NSError(domain: "taskForGETMethod", code: 1, userInfo: userInfo))
      }
      
      /* GUARD: Was there an error? */
      guard (error == nil) else {
        sendError("There was an error with your request: \(error!)")
        return
      }
      
      /* GUARD: Did we get a successful 2XX response? */
      guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
        sendError("Your request returned a status code other than 2xx!")
        return
      }
      
      /* GUARD: Was there any data returned? */
      guard let data = data else {
        sendError("No data was returned by the request!")
        return
      }
      
      /* 5/6. Parse the data and use the data (happens in completion handler) */
      completionHandlerForImage(data, nil)
    }
    
    /* 7. Start the request */
    task.resume()
    
    return task
  }
  
  // MARK: Helpers
 
  // given raw JSON, return a usable Foundation object
  private func convertDataWithCompletionHandler(_ data: Data, completionHandlerForConvertData: (_ result: AnyObject?, _ error: NSError?) -> Void) {
    
    var parsedResult: AnyObject! = nil
    do {
      parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
    } catch {
      let userInfo = [NSLocalizedDescriptionKey: "Could not parse the data as JSON: '\(data)'"]
      completionHandlerForConvertData(nil, NSError(domain: "converDataWithCompletionHandler", code: 1, userInfo: userInfo))
    }
    
    completionHandlerForConvertData(parsedResult, nil)
    
  }
  
  // create a URL from parameters
  private func urlFromParameters(_ parameters: [String:AnyObject], withPathExtension: String? = nil) -> URL {
    var components = URLComponents()
    components.scheme = Client.Constants.ApiScheme
    components.host = Client.Constants.ApiHost
    components.path = Client.Constants.ApiPath + (withPathExtension ?? "")
    components.queryItems = [URLQueryItem]()
    
    
    for (key, value) in parameters {
      let queryItem = URLQueryItem(name: key, value: "\(value)")
      components.queryItems!.append(queryItem)
    }
    
    // print url for the request
    print("url: \(String(describing: components.url))")
    
    return components.url!
    
  }
  
  // MARK: Shared Instance
  
  class func sharedInstance() -> Client {
    struct Singleton {
      static var sharedInstance = Client()
    }
    return Singleton.sharedInstance
  }
  
  
  
}
