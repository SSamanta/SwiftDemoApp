//
//  ServiceManager.swift
//  SwiftDemoApp
//
//  Created by Susim on 6/17/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

import UIKit

typealias ServiceCompletionHandler = (obj:AnyObject?, error :NSError?) ->Void

class ServiceManager: NSObject {
    func getAppDataOnCompletion(serviceCompletionHandler : ServiceCompletionHandler) {
        var urlString : NSString = "http://itunes.apple.com/us/rss/topfreeapplications/limit=100/json";
        var restClient = SSRestClient()
		restClient.getJsonData(urlString, restClientHandler: { (obj , error) -> Void in
            var dict : NSDictionary = obj! as NSDictionary
            if let apps = dict["feed"]!["entry"] as? NSArray{
                var allApps = [App]()
                for app in apps {
                    allApps.append(App(dict: app as NSDictionary))
                }
                serviceCompletionHandler(obj:allApps, error:error)
            }

        })
    }
}
