//
//  DetailsVC.swift
//  SwiftDemoApp
//
//  Created by Susim on 6/17/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet weak var descriptionTv : UITextView!
    var app : App?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.app?.appName
        self.descriptionTv.text =  self.app?.appSummary;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func refreshWithDataSource(app : App) {
        self.app = app
    }
}
