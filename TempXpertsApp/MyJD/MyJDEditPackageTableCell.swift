//
//  MyJDEditPackageTableCell.swift
//  Riot
//
//  Created by Swagat on 6/18/20.
//  Copyright © 2020 Justdial Ltd. All rights reserved.
//

import UIKit
import SDWebImage

class MyJDEditPackageTableCell: UITableViewCell {

    
    @IBOutlet weak var radioButtonImageView: UIImageView!
    
    @IBOutlet weak var arrowImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var optionsButton: UIButton!
    @IBOutlet weak var optionsButtonWidth: NSLayoutConstraint!
    
    @IBOutlet weak var arrowWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
