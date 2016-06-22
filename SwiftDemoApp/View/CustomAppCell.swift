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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func refreshWithDataSource(_ app:App) {
        
        self.appNameLbl.text =  app.appName
        self.appArtistLbl.text =  "Developed By \(app.appArtists!)"
        self.setCircularImage(self.thumnailImageView)
        let apiClient = SSHTTPClient(url: app.appThumnailImageLink! as String, method: "GET", httpBody: nil, headerFieldsAndValues: nil)
		apiClient.getResponseData({ (obj, error) -> Void in
            if (error == nil) {
                DispatchQueue.main.async(execute: { () -> Void in
                    let imageData =  obj as! Data?
                    let bgImage = UIImage(data: imageData!)
                    self.thumnailImageView.image = bgImage})
            }else {
                print(error, terminator: "")
            }

        })
    }
    func setCircularImage(_ image: UIImageView) {
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.black().cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }
}
