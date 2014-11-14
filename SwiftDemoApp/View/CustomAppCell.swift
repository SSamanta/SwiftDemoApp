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
    }

}
