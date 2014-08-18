//
//  DetailsVC.swift
//  SwiftDemoApp
//
//  Created by Susim on 6/17/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Apps Details"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
