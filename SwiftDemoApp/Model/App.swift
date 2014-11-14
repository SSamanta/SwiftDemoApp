//
//  App.swift
//  SwiftDemoApp
//
//  Created by Susim on 6/17/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

import UIKit

class App: NSObject {
    var appName : NSString?
     init(dict : NSDictionary) {
        self.appName = dict["im:name"]!["label"] as NSString?
    }
}
