//
//  MyJDSubStagePopupCell.swift
//  Riot
//
//  Created by Swagat on 6/24/20.
//  Copyright © 2020 Justdial Ltd. All rights reserved.
//

import UIKit
import SDWebImage

class MyJDSubStagePopupCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    
    
    @IBOutlet weak var issueLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.layer.cornerRadius = 4
        bgView.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
