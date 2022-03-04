//
//  MyJDSubStageTableCell.swift
//  Riot
//
//  Created by Swagat on 6/15/20.
//  Copyright © 2020 Justdial Ltd. All rights reserved.
//

import UIKit
import SDWebImage

class MyJDSubStageTableCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var targetsSet = false
    
    @IBOutlet weak var dottedLineViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var dottedLineView: UIView!
    
    @IBOutlet weak var borderView: UIView!
    
    
    @IBOutlet weak var hotsellerLabel: UILabel!
    
    
    @IBOutlet weak var bottomViewDetailsView: UIView!
    
    @IBOutlet weak var viewDetailsButton: UIButton!
    
    
    @IBOutlet weak var timeButtonHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var mrpPriceLabelHeight: NSLayoutConstraint!
    
    @IBOutlet weak var photoHeightConstraint: NSLayoutConstraint!
    
    
    
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    
    @IBOutlet weak var buttonCurve: UIView!
    
    @IBOutlet weak var minusButton: UIButton!
    
    
    @IBOutlet weak var plusButton: UIButton!
    
    var serviceNameString = ""
    
    var currentParentRow = 0
    
    @IBOutlet var servicename : UILabel!
    
    @IBOutlet var mrpPriceLabel : UILabel!

    @IBOutlet var discountedPriceLabel : UILabel!
    
       @IBOutlet var timeButton : UIButton!
   
         @IBOutlet var photoCollectionView : UICollectionView!
       @IBOutlet var descriptionTableView : UITableView!
    
    
    var photoUrlArray : [String] = []
    
    var descriptionArray : [MyJDSubStageDataResultsDescModel] = []
    
    
    @IBOutlet weak var hotsellerImageWidth: NSLayoutConstraint!
    
    @IBOutlet weak var hotsellerImage: UIImageView!
    
    @IBOutlet weak var guaranteeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        timeButton.titleLabel?.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        timeButton.titleLabel?.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        timeButton.titleLabel?.lineBreakMode = .byWordWrapping
        timeButton.titleLabel?.numberOfLines = 1
        dottedLineView.createDottedLine(width: 1, color: UIColor.colorFromRGB(228, g: 234, b: 239).cgColor, startPoint: CGPoint(x: 0, y: 20), endPoint: CGPoint(x: UIScreen.main.bounds.size.width - 80, y: 20))
        borderView.layer.borderWidth = 1
        borderView.layer.borderColor = UIColor.colorFromRGB(228, g: 234, b: 239).cgColor
        borderView.layer.cornerRadius = 10
        borderView.layer.masksToBounds = true
         guaranteeLabel.font = UIFont(name: "OpenSans", size: 9.0)
       
        guaranteeLabel.layer.cornerRadius = 2
        guaranteeLabel.layer.masksToBounds = true
        
        
        mrpPriceLabel.font = UIFont(name: "OpenSans-Bold", size: 18.0)
        discountedPriceLabel.font = UIFont(name: "OpenSans", size: 16.0)
        mrpPriceLabel.textColor = UIColor.colorFromRGB(26, g: 27, b: 29)
        
        hotsellerLabel.font =  UIFont(name: "OpenSans", size: 9.0)
        hotsellerLabel.layer.cornerRadius = 2
        hotsellerLabel.layer.masksToBounds = true
        
        viewDetailsButton.titleLabel?.font = UIFont(name: "OpenSans-Semibold", size: 12.0)
        buttonCurve.layer.cornerRadius = 5
        buttonCurve.layer.masksToBounds = true
        buttonCurve.layer.borderWidth = 1
        buttonCurve.layer.borderColor = UIColor.colorFromRGB(0, g: 118, b: 215).cgColor
        photoCollectionView.register(UINib(nibName: "MyJDSubStagePhotoCollectionCell", bundle: nil), forCellWithReuseIdentifier: "MyJDSubStagePhotoCollectionCell")
        
        
        descriptionTableView.register(UINib(nibName: "MySubStageDescriptionCell", bundle: nil), forCellReuseIdentifier: "MySubStageDescriptionCell")
       
        
        descriptionTableView.delegate = self
        descriptionTableView.dataSource = self
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        // Initialization code
        descriptionTableView.isScrollEnabled = false
        photoCollectionView.contentInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)

        
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK: - Description TableView

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return descriptionArray.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MySubStageDescriptionCell" , for: indexPath) as! MySubStageDescriptionCell
        
        if !descriptionArray[indexPath.row].subTextFlag {
            let attributedString = NSMutableAttributedString(string: "\(descriptionArray[indexPath.row].description)" != "" ? "\(descriptionArray[indexPath.row].title) - \(descriptionArray[indexPath.row].description)" : "\(descriptionArray[indexPath.row].title)", attributes: [
                .font: UIFont(name: "OpenSans-Semibold", size: 13.0)!,
                .foregroundColor: UIColor.gunmetal
            ])
            attributedString.addAttribute(.font, value: UIFont(name: "OpenSans-Regular", size: 13.0) ?? UIFont.systemFont(ofSize: 13), range: NSRange(location: 0, length: descriptionArray[indexPath.row].title.length))
            
            cell.descriptionLabel.attributedText = attributedString
            cell.greenDotWidth.constant = 6
            cell.descriptionLeadingConstraint.constant = 52
        }else{
            
            let attributedString = NSMutableAttributedString(string: "\(self.serviceNameString) \(indexPath.row + 1) - \(descriptionArray[indexPath.row].description)", attributes: [
                .font: UIFont(name: "OpenSans-Regular", size: 14.0)!,
                .foregroundColor: UIColor.gunmetal
            ])
            
            
            attributedString.addAttribute(.font, value: UIFont(name: "OpenSans-Semibold", size: 14.0) ?? UIFont.systemFont(ofSize: 14), range: NSRange(location: 0, length: "\(self.serviceNameString) \(indexPath.row + 1)".length))
            
            cell.descriptionLabel.attributedText = attributedString
            cell.greenDotWidth.constant = 0
            cell.descriptionLeadingConstraint.constant = 40

            
            
            
        }
        if descriptionArray[indexPath.row].lineBelow {
            cell.dottedLineHeight.constant = 24
        }else{
            cell.dottedLineHeight.constant = 0

        }
        
        
        return cell
      }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layoutIfNeeded()
    }
    
    //MARK: - Photo CollectionView
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoUrlArray.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyJDSubStagePhotoCollectionCell", for: indexPath) as! MyJDSubStagePhotoCollectionCell
        
            cell.photoIV.sd_setImage(with: URL(string: photoUrlArray[indexPath.row]), placeholderImage: UIImage(named: "no_image"))
        
        
        
        return cell
        
        
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 40)
    }
    
    
    override func prepareForReuse() {
        serviceNameString = ""
    }

}
