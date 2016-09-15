//
//  ServiceManager.swift
//  SwiftDemoApp
//
//  Created by Susim on 6/17/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

import UIKit

typealias ServiceCompletionHandler = (_ json :AnyObject?, _ error :NSError?) ->Void

class AppService: NSObject {
    class func getiTunesFreeAppsOnCompletion(_ serviceCompletionHandler : @escaping ServiceCompletionHandler) {
        let itunesFreeAppsUrlString : NSString = kItunesURLString as NSString;
        let freeAppsClient = SSHTTPClient(url: itunesFreeAppsUrlString as String, method: "GET", httpBody: nil, headerFieldsAndValues: nil)
		freeAppsClient.getJsonData({ (obj , error) -> Void in
            serviceCompletionHandler(obj, error)
        })
    }
}
