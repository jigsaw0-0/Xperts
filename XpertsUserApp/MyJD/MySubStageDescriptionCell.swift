//
//  MySubStageDescriptionCell.swift
//  Riot
//
//  Created by Swagat on 6/15/20.
//  Copyright © 2020 Justdial Ltd. All rights reserved.
//

import UIKit
import SDWebImage

class MySubStageDescriptionCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var greenDotWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dottedLineHeight: NSLayoutConstraint!
    
    @IBOutlet weak var dottedLineView : UIView!
    
    @IBOutlet weak var descriptionLeadingConstraint: NSLayoutConstraint!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dottedLineView.createDottedLine(width: 1, color: UIColor.colorFromRGB(228, g: 234, b: 239).cgColor, startPoint: CGPoint(x: 0, y: 12), endPoint: CGPoint(x: UIScreen.main.bounds.size.width - 80, y: 12))
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
