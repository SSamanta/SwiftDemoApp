//
//  RootVC.swift
//  SwiftDemoApp
//
//  Created by Susim on 6/17/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

import UIKit

class RootVC: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var activityIndicatorView : UIActivityIndicatorView!
    var allApps = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Apps"
        self.activityIndicatorView.startAnimating()
        var svmgr = ServiceManager()
        svmgr.getAppDataOnCompletion { (appsArray, error) -> Void in
    		self.allApps =  appsArray! as NSArray
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
                self.activityIndicatorView.stopAnimating()
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allApps.count
    }
    
     func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let identifier = "CustomAppCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as CustomAppCell
        let app = self.allApps[indexPath.row] as App
        cell.refreshWithDataSource(app)
        return cell
    }
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        let detailsVC :DetailsVC = storyboard?.instantiateViewControllerWithIdentifier("DetailsVC") as DetailsVC
        detailsVC.refreshWithDataSource(self.allApps[indexPath.row] as App)
        self.navigationController?.pushViewController(detailsVC, animated:true);
    }
}
