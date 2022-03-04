//
//  MyJDSubStagePhotoCollectionCell.swift
//  Riot
//
//  Created by Swagat on 6/16/20.
//  Copyright © 2020 Justdial Ltd. All rights reserved.
//

import UIKit
import SDWebImage

class MyJDSubStagePhotoCollectionCell: UICollectionViewCell {
    @IBOutlet weak var photoIV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoIV.layer.cornerRadius = 5
        photoIV.layer.masksToBounds = true
        
        // Initialization code
    }

}
