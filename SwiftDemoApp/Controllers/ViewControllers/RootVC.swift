//
//  RootVC.swift
//  SwiftDemoApp
//
//  Created by Susim on 6/17/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

import UIKit

class RootVC: UIViewController , UITableViewDataSource,UITableViewDelegate{
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Apps"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
     func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
     func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let identifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = "Demo"
        return cell
    }
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        let detailsVC :DetailsVC = storyboard.instantiateViewControllerWithIdentifier("DetailsVC") as DetailsVC
        self.navigationController.pushViewController(detailsVC, animated:true);
    }
}
