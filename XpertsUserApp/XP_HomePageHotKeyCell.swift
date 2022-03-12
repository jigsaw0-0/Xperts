//
//  MyCollectionCell.swift
//  TempXpertsApp
//
//  Created by Sriram S on 26/02/22.
//

import UIKit

class XP_HomePageHotKeyCell: UICollectionViewCell {
    static let identifier = "MyCollectionCell"
    
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "catPic")
       // print("IV init")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
   
    
//    override class func awakeFromNib() {
//        self.imageView.image = UIImage(named: "catPic")
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.contentView.addSubview(imageView)
        imageView.addConstraints(contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, centerY: nil, centerX: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, centerYConstant: 0, centerXConstant: 0, widthConstant: 0, heightConstant: 0)
        
      //  imageView.frame = self.contentView.frame
        imageView.backgroundColor = .yellow

        
        
        
        
        //  print("Cell init")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}


