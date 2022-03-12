//
//  MyJDSubStageViewDetailsDescCellFAQ.swift
//  Riot
//
//  Created by Sriram S on 26/11/20.
//  Copyright © 2020 Justdial Ltd. All rights reserved.
//

import UIKit
import SDWebImage

class MyJDSubStageViewDetailsDescCellFAQ: UITableViewCell {

    @IBOutlet weak var QLabel: UILabel!
    
    
    @IBOutlet weak var ALabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        QLabel.font = UIFont.init(name: "OpenSans-Semibold", size: 14)
        ALabel.font = UIFont.init(name: "OpenSans", size: 13)
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
