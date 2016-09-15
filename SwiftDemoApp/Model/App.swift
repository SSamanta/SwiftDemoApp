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
        let nameDict = dict["im:name"] as? NSDictionary
        self.appName = nameDict!["label"] as! String?
        let imageDictList = dict["im:image"] as? NSArray
        if (imageDictList != nil) {
            let imageDict = imageDictList![0] as? NSDictionary
            self.appThumnailImageLink =  imageDict!["label"] as! String?
        }
        
        let summaryDict = dict["summary"] as? NSDictionary
        self.appSummary = summaryDict!["label"] as! String?
        let priceDict = dict ["im:price"] as? NSDictionary
        self.appPrice =  priceDict!["label"] as! String?
        let artistDict = dict["im:artist"] as? NSDictionary
        self.appArtists = artistDict!["label"] as! String?
    }
}
