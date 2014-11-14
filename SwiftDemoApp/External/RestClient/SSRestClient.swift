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
        var request = NSMutableURLRequest(URL: NSURL(string: urlString!)!)
        var session = NSURLSession.sharedSession()
        var task = session.dataTaskWithRequest(request, completionHandler: { (data, response , error) -> Void in
            if (error == nil) {
                var jsonError : NSError?
                var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &jsonError) as? NSDictionary
				if (jsonError == nil) {
                    restClientHandler(obj: json as AnyObject?,error: nil)
                }else {
                    restClientHandler(obj: nil,error: jsonError)
                }
			}else {
                restClientHandler(obj: nil,error: error)
            }
        })
        task.resume()
    }
}
