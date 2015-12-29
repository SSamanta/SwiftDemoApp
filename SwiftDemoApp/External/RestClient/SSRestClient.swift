//
//  SSRestClient.swift
//  SwiftDemoApp
//
//  Created by Susim on 11/14/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

import UIKit
typealias SSRestClientHandler = (obj : AnyObject? , error : NSError?) -> Void

class SSRestClient: NSObject {
    func getJsonData(urlString :NSString?,restClientHandler : SSRestClientHandler) {
        let request = NSMutableURLRequest(URL: NSURL(string: urlString! as String)!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response , error) -> Void in
            if (error == nil) {
                var jsonError : NSError?
                var json : AnyObject?
                do {
                    json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves)
                } catch let error as NSError {
                    jsonError = error
                    json = nil
                } catch {
                    fatalError()
                }
                if let object = json as? Array <AnyObject> {
                    restClientHandler(obj: object ,error: nil)
                }else if let object = json as? Dictionary <String, AnyObject> {
                    restClientHandler(obj: object ,error: nil)
                }else {
                    restClientHandler(obj: nil,error:jsonError)
                }
            }else {
                restClientHandler(obj: nil,error: error)
            }
        })
        task.resume()
    }
    func getResponseData(urlString :NSString?,restClientHandler : SSRestClientHandler) {
        let request = NSMutableURLRequest(URL: NSURL(string: urlString! as String)!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response , error) -> Void in
            if (error == nil) {
				restClientHandler (obj: data, error: nil)
            }else {
                restClientHandler(obj: nil,error: error)
            }
        })
        task.resume()
    }
}
