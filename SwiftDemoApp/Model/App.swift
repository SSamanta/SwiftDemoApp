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
    var appThumnailImageLink : NSString?
    var appSummary : NSString?
    var appPrice : NSString?
    var appArtists : NSString?
    
     init(dict : NSDictionary) {
        self.appName = dict["im:name"]!["label"] as NSString?
        self.appThumnailImageLink =  dict["im:image"]![0]["label"] as NSString?
        self.appSummary = dict["summary"]!["label"] as NSString?
        self.appPrice =  dict ["im:price"]!["label"] as NSString?
        self.appArtists = dict ["im:artist"]!["label"] as NSString?
    }
}
