//
//  App.swift
//  SwiftDemoApp
//
//  Created by Susim on 6/17/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

import UIKit

class App: NSObject {
    var appName : String?
    var appThumnailImageLink : String?
    var appSummary : String?
    var appPrice : String?
    var appArtists : String?
    
     init(dict : NSDictionary) {
        self.appName = dict["im:name"]!["label"] as! String?
        self.appThumnailImageLink =  dict["im:image"]![0]["label"] as! String?
        self.appSummary = dict["summary"]!["label"] as! String?
        self.appPrice =  dict ["im:price"]!["label"] as! String?
        self.appArtists = dict ["im:artist"]!["label"] as! String?
    }
}
