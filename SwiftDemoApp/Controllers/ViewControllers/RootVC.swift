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
    var allApps = [App]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		self.loadDataSource()
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    func loadDataSource() {
        self.title = "Apps"
        self.activityIndicatorView.startAnimating()
        AppsManager.getItunesFreeApps { (apps, error) in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.activityIndicatorView.stopAnimating()
                if error != nil {
                    print(error)
                }else {
                     self.allApps =  apps!
                    self.tableView.reloadData()
                }
            })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allApps.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "CustomAppCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! CustomAppCell
        let app = self.allApps[indexPath.row] as App
        cell.refreshWithDataSource(app)
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let detailsVC :DetailsVC = storyboard?.instantiateViewControllerWithIdentifier("DetailsVC") as! DetailsVC
        detailsVC.refreshWithDataSource(self.allApps[indexPath.row] as App)
        self.navigationController?.pushViewController(detailsVC, animated:true);
    }
}
