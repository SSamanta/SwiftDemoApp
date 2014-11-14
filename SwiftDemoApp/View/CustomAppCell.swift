//
//  CustomAppCell.swift
//  SwiftDemoApp
//
//  Created by Susim on 11/14/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

import UIKit

class CustomAppCell: UITableViewCell {
    @IBOutlet var appNameLbl : UILabel!
    @IBOutlet var thumnailImageView : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func refreshWithDataSource(app:App) {
        self.appNameLbl.text =  app.appName
        var restClient = SSRestClient()
		restClient.getResponseData(app.appThumnailImageLink, restClientHandler: { (obj, error) -> Void in
            if (error == nil) {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    var imageData =  obj as NSData?
                    var bgImage = UIImage(data: imageData!)
                    self.thumnailImageView.image = bgImage})
            }else {
                print(error)
            }

        })
    }

}
