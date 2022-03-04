//
//  MyJDSubStageSectionHeaderView.swift
//  Riot
//
//  Created by Sayani De on 09/08/20.
//  Copyright © 2020 Justdial Ltd. All rights reserved.
//

import UIKit
import SDWebImage

class MyJDSubStageSectionHeaderView: UIView {

    
    @IBOutlet weak var curvedView: UIView!
    
    
    @IBOutlet weak var imageV: UIImageView!
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var imageHeightContraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        curvedView.layer.cornerRadius = 5
        curvedView.layer.masksToBounds = true
    }
    func instanceFromNib(_ vc:UIViewController) -> UIView{
             let views:UIView = UINib(nibName: "MyJDSubStageSectionHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! MyJDSubStageSectionHeaderView
             return views
             
         }
}
