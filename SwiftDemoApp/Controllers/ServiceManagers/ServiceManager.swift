//
//  ServiceManager.swift
//  SwiftDemoApp
//
//  Created by Susim on 6/17/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

import UIKit

typealias ServiceCompletionHandler = (obj:NSArray?, error :NSError?) ->Void

class ServiceManager: NSObject {
    func getAppDataOnCompletion(serviceCompletionHandler : ServiceCompletionHandler) {
        var urlString : NSString = "http://itunes.apple.com/us/rss/topfreeapplications/limit=100/json";
        var request = NSURLRequest(URL: NSURL(string: urlString)!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response , data , error) -> Void in
            var dict : NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
            if let apps = dict["feed"]!["entry"] as? NSArray{
                var allApps = [App]()
                for app in apps {
                    allApps.append(App(dict: app as NSDictionary))
                }
				serviceCompletionHandler(obj:allApps, error:nil)
            }

        }
    }
}
