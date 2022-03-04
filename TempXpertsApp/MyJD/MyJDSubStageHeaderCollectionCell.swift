//
//  MyJDSubStageHeaderCollectionCell.swift
//  Riot
//
//  Created by Swagat on 6/15/20.
//  Copyright © 2020 Justdial Ltd. All rights reserved.
//

import UIKit
import SDWebImage

class MyJDSubStageHeaderCollectionCell: UICollectionViewCell {
   
    
    @IBOutlet weak var downImageView: UIImageView!
    
    @IBOutlet weak var KeyLabel: UILabel!
    
    
    @IBOutlet weak var underlineBar: UIView!
    
    
    @IBOutlet weak var filterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        KeyLabel.layer.cornerRadius = 6
        KeyLabel.layer.masksToBounds = true
        KeyLabel.font = UIFont(name: "OpenSans", size: 13)

        // Initialization code
    }
    override func prepareForReuse() {
        KeyLabel.font = UIFont(name: "OpenSans", size: 13)
        downImageView.isHidden = true
        filterLabel.isHidden = true
        
    }
    
}

