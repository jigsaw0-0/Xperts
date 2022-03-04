//
//  MyJDSubStageAddOnCell.swift
//  Riot
//
//  Created by Swagat on 6/19/20.
//  Copyright © 2020 Justdial Ltd. All rights reserved.
//

import UIKit
import SDWebImage

class MyJDSubStageAddOnCell: UITableViewCell {
    @IBOutlet weak var serviceName: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var buttonCurve: UIView!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var mrpPriceLabel: UILabel!
    
    @IBOutlet weak var discountedPriceLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonCurve.layer.cornerRadius = 5
        buttonCurve.layer.masksToBounds = true
        
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
