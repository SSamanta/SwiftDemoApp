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
        self.loadInitialScene()
		self.loadDataSource()
    }
    func loadInitialScene(){
        self.title = "Apps"
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    func loadDataSource() {
        self.showNetworkLoaderScene()
        AppsManager.getItunesFreeApps { (apps, error) in
            if apps != nil {
                self.handleMainSceneActivity(error, apps: apps!)
            }
        }
    }
    func handleMainSceneActivity(_ error : NSError?, apps:[App]) {
        DispatchQueue.main.async(execute: { () -> Void in
            self.hideNetowkrLoaderScene()
            if error != nil {
                self.showErrorScene(error!)
            }else {
                self.refreshMainScene(apps)
            }
        })
    }
    func showErrorScene(_ error : NSError) {
        print(error)
    }
    func refreshMainScene(_ apps : [App]) {
        self.allApps =  apps
        self.tableView.reloadData()
    }
    func showNetworkLoaderScene() {
        self.activityIndicatorView.startAnimating()
    }
    func hideNetowkrLoaderScene() {
        self.activityIndicatorView.stopAnimating()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allApps.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let identifier = "CustomAppCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CustomAppCell
        let app = self.allApps[(indexPath as NSIndexPath).row] as App
        cell.refreshWithDataSource(app)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath){
        let detailsVC :DetailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        detailsVC.refreshWithDataSource(self.allApps[(indexPath as NSIndexPath).row] as App)
        self.navigationController?.pushViewController(detailsVC, animated:true);
    }
}
