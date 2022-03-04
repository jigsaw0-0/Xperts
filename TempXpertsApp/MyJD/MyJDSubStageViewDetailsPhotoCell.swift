//
//  MyJDSubStageViewDetailsPhotoCell.swift
//  Riot
//
//  Created by Sayani De on 31/07/20.
//  Copyright © 2020 Justdial Ltd. All rights reserved.
//

import UIKit
import SDWebImage

class MyJDSubStageViewDetailsPhotoCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageV: UIImageView!
    
    override func awakeFromNib() {
          super.awakeFromNib()
        
        imageV.layer.cornerRadius = 10
        imageV.layer.masksToBounds = true
        imageV.contentMode = .scaleAspectFill
        
      }
    
    
}
