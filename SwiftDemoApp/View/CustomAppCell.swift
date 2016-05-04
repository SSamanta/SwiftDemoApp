//
//  CustomAppCell.swift
//  SwiftDemoApp
//
//  Created by Susim on 11/14/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

import UIKit

class CustomAppCell: UITableViewCell {
    
    @IBOutlet weak var appNameLbl : UILabel!
    @IBOutlet weak var appPriceLbl : UILabel!
    @IBOutlet weak var appArtistLbl : UILabel!
    @IBOutlet weak var appSummaryLbl : UILabel!
    @IBOutlet weak var thumnailImageView : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func refreshWithDataSource(app:App) {
        
        self.appNameLbl.text =  app.appName
        self.appArtistLbl.text =  "Developed By \(app.appArtists!)"
        self.setCircularImage(self.thumnailImageView)
        let apiClient = SSHTTPClient(url: app.appThumnailImageLink! as String, method: "GET", httpBody: nil, headerFieldsAndValues: nil)
		apiClient.getResponseData({ (obj, error) -> Void in
            if (error == nil) {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let imageData =  obj as! NSData?
                    let bgImage = UIImage(data: imageData!)
                    self.thumnailImageView.image = bgImage})
            }else {
                print(error, terminator: "")
            }

        })
    }
    func setCircularImage(image: UIImageView) {
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.blackColor().CGColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }
}
