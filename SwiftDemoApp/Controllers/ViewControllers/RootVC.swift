//
//  RootVC.swift
//  SwiftDemoApp
//
//  Created by Susim on 6/17/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

import UIKit

class RootVC: UIViewController {
    @IBOutlet var tableView:UITableView!
    var allApps = [];
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Apps"
        var svmgr = ServiceManager()
        svmgr.getAppDataOnCompletion { (appsArray, error) -> Void in
    		self.allApps =  appsArray!
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
     func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allApps.count
    }
    
     func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let identifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as UITableViewCell
        let app = self.allApps[indexPath.row] as App
        cell.textLabel?.text = app.appName
        return cell
    }
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        let detailsVC :DetailsVC = storyboard?.instantiateViewControllerWithIdentifier("DetailsVC") as DetailsVC
        self.navigationController?.pushViewController(detailsVC, animated:true);
    }
}