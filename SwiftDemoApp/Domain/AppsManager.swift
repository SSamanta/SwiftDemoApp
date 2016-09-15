//
//  AppsManager.swift
//  SwiftDemoApp
//
//  Created by Susim Samanta on 06/05/16.
//  Copyright © 2016 Susim. All rights reserved.
//

import UIKit

typealias AppsHandler = (_ apps :[App]?, _ error :NSError?) ->Void

class AppsManager: NSObject {
    class func getItunesFreeApps(_ appsHandler : @escaping AppsHandler) {
        AppService.getiTunesFreeAppsOnCompletion { (json, error) in
            if error != nil {
                appsHandler(nil , error)
            }else {
                let jsonDict = json as! NSDictionary
                let feedDict = jsonDict["feed"] as? NSDictionary
                if let apps = feedDict!["entry"] as? NSArray{
                    var allApps = [App]()
                    for app in apps {
                        allApps.append(App(dict: app as! NSDictionary))
                    }
                    appsHandler(allApps , nil)
                }
            }
        }
    }
}
