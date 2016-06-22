//
//  AppsManager.swift
//  SwiftDemoApp
//
//  Created by Susim Samanta on 06/05/16.
//  Copyright © 2016 Susim. All rights reserved.
//

import UIKit

typealias AppsHandler = (apps :[App]?, error :NSError?) ->Void

class AppsManager: NSObject {
    class func getItunesFreeApps(_ appsHandler : AppsHandler) {
        AppService.getiTunesFreeAppsOnCompletion { (json, error) in
            if error != nil {
                appsHandler(apps: nil , error: error)
            }else {
                let jsonDict = json as! NSDictionary
                if let apps = jsonDict["feed"]!["entry"] as? NSArray{
                    var allApps = [App]()
                    for app in apps {
                        allApps.append(App(dict: app as! NSDictionary))
                    }
                    appsHandler(apps: allApps , error: nil)
                }
            }
        }
    }
}
