//
//  MyJDSubStageController.swift
//  Riot
//
//  Created by Swagat on 6/15/20.
//  Copyright © 2020 Justdial Ltd. All rights reserved.
//

import UIKit
import SDWebImage

@objcMembers class MyJDSubStageController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerDoneButton: UIButton!
    var filterChosen = false
    
    @IBOutlet weak var filterPickerView: UIView!
    
    
    @IBOutlet weak var filterPickerBottomConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var picker: UIPickerView!
    
    
    @IBOutlet weak var loaderViewInitial: UIView!
    
    var addButtonInProgressFlag = false
    
    
    var popUpFooterText = ""
    var currentSelectedSection = 0
    @IBOutlet weak var mainHeaderHeightConstraint: NSLayoutConstraint!
    var dummyServiceNameLabel : UILabel!
    var noteHeightConstraint : NSLayoutConstraint?
    @IBOutlet weak var proceedWarningLabel: UILabel!
    
    var scrollCheckDisabled = false
    var initialScrollSet = false
    
    @IBOutlet weak var grayBG : UIView!
    
    var upiData : Dictionary<String, AnyObject>!
    @IBOutlet weak var popUpViewHeightConstraint: NSLayoutConstraint!
    
    var popUpHeightinFloat : CGFloat = 444
    
    @IBOutlet weak var popUpMainView: UIView!
    
    @IBOutlet weak var popUpTitleView: UIView!
    
    @IBOutlet weak var popUpTitle1: UILabel!
    
    @IBOutlet weak var popUpTitle2: UILabel!
    
    @IBOutlet weak var popUpOkButton: UIButton!
    
    
    @IBOutlet weak var popUpTableView: UITableView!
    
    
    @IBOutlet weak var popUpBottomConstraint: NSLayoutConstraint!
    
    
    var popUpResultsArray : Array<Dictionary<String, String>> = []
    @IBOutlet weak var continueView: UIView!
    var popUpDictionary : Dictionary<String, AnyObject>?
    var currentSection : MyJDSubStageDataElement?
    
    @IBOutlet weak var continueButton: UIButton!
    
    @IBOutlet weak var curveQtyView: UIView!
    
    @IBOutlet weak var qtyLabel: UILabel!
    var currentServicesObject : MyJDCurrentSelectedServicesModel?
    var currentPrevOrder : MyJDSubStagePrevOrderModel?
    @IBOutlet weak var priceLabel: UILabel!
    
    var currentSelectedServiceDict : Dictionary<String, AnyObject> = [:]
  
    @IBOutlet weak var whiteRightArrow: UIImageView!
    
    
    @IBOutlet weak var continueBottomConstraint: NSLayoutConstraint!
    
    @objc var urlParams: Dictionary<String, AnyObject>?
    var ncatid = ""
    var catid = ""
    @objc var catTitle = ""
    @objc var urlString = "https://jdxperts.justdial.com/user/get_sub_stage?passKey=catid&passValue=1001&city=Bangalore&oid=&wap=2&searchReferrer=gen%7Chk&utm_source=&utm_medium=&version=1.3"
    var urlConfig = "user"
    @IBOutlet weak var mainHeaderView: UIView!
    
    @IBOutlet weak var topHeaderView: UIView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var searchButton: UIButton!
    
    
    @IBOutlet weak var topTitleLabel: UILabel!
    
    @IBOutlet weak var headerCollectionView: UICollectionView!
    
    @IBOutlet weak var mainTableView: UITableView!
    
    var responseData : MyJDSubStageModel?
    var dummyHeaderLabel : UILabel!
    var currentOrderId = ""
    
    
   
    
//    func getSelectedCurrentServicesFromPrevOrder(_ prevOrder : MyJDSubStagePrevOrderModel) -> MyJDCurrentSelectedServicesModel{
//
//
//        var objForCurrentServModel : Dictionary<String, AnyObject>  = [:]
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//         let obj = Mapper<MyJDCurrentSelectedServicesModel>().map(JSONObject: objForCurrentServModel)
//
//        return obj
//
//    }
    
    
    @objc func updatePrevOrderByNotification(_ notification : NSNotification) {
        
    // print("check")
        
        if let originVC = (notification.object as? Dictionary<String, AnyObject>)?["originVC"] as? MyJDSubStageController {
            if originVC == self {
                return
            }
            
        }
        if let prevOrder = (notification.object as? Dictionary<String, AnyObject>)?["prevOrder"] as? MyJDSubStagePrevOrderModel {

            if self.ncatid == prevOrder.ncatid {
        
        if let currServModels = (notification.object as? Dictionary<String, AnyObject>)?["currServices"] as? [MyJDCurrServicesModel] {
        var currentSelectedServiceDictLocal : Dictionary<String, AnyObject> = [:]

          for currServicesObj in currServModels {
              
              
              currentSelectedServiceDictLocal[currServicesObj.service_id] = currServicesObj.qty as AnyObject
              
              
          }
          
            self.mergecurrServicestosDesc(currServModels)
            
          self.currentSelectedServiceDict = currentSelectedServiceDictLocal
            self.mainTableView.reloadData()
        }
        
        
            self.currentOrderId = prevOrder.oid
            self.updatePrevOrder(prevOrder)
        }
        
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.navigationBar.isHidden = true
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerDoneButton.titleLabel?.font = UIFont(name: "OpenSans-Semibold", size: 16)
        headerCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        let hV = UIView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 1))
        mainTableView.tableHeaderView = hV
        //mainTableView.contentInset = UIEdgeInsets(top: -35, left: 0, bottom: 0, right: 0)
        dummyServiceNameLabel = UILabel.init(frame : CGRect(x: 0, y: 0, width: self.view.frame.size.width - 122, height: 200))
        dummyServiceNameLabel = UILabel(frame: .zero)
        dummyServiceNameLabel.font = UIFont(name: "OpenSans-Semibold", size: 16)
        dummyServiceNameLabel.numberOfLines = 0
        dummyServiceNameLabel.preferredMaxLayoutWidth = self.view.frame.size.width - 122
        self.view.addSubview(dummyServiceNameLabel)
        dummyServiceNameLabel.isHidden = true
        let mainFoorV = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 70))
        mainFoorV.backgroundColor = UIColor.white
        mainTableView.tableFooterView = mainFoorV
        
        
        self.edgesForExtendedLayout = .bottom
        self.extendedLayoutIncludesOpaqueBars = true
         NotificationCenter.default.addObserver(self, selector: #selector(self.updatePrevOrderByNotification(_:)), name: NSNotification.Name(rawValue: "myJDOrderModified"), object: nil)
        
        upiData = Dictionary<String, AnyObject>()//(UIApplication.shared.delegate as! AppDelegate).justdialAppDelegate.upiData() as! Dictionary<String, AnyObject>
        
        self.urlString = self.urlString + "&deviceid=\(upiData["device_id"] as? String ?? "")"
        popUpOkButton.layer.cornerRadius = popUpOkButton.frame.size.height/2
        popUpOkButton.layer.masksToBounds = true
        popUpMainView.layer.cornerRadius = 20
        popUpMainView.layer.masksToBounds = true
        popUpTableView.delegate = self
        popUpTableView.dataSource = self
        
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeDetails(_:)))
             tapGestureRecognizer.numberOfTapsRequired = 1
             self.grayBG.addGestureRecognizer(tapGestureRecognizer)
             self.grayBG.isUserInteractionEnabled = true
        
        if catTitle.length > 0 {
            self.topTitleLabel.text = self.catTitle
        }else{
            self.topTitleLabel.text = ""
        }
        
        
        continueButton.layer.cornerRadius = continueButton.frame.size.height/2
        continueButton.layer.masksToBounds = true
        
        
        curveQtyView.layer.cornerRadius = 4
        curveQtyView.layer.borderWidth = 1.5
        curveQtyView.layer.borderColor = UIColor.white.cgColor
        curveQtyView.layer.masksToBounds = true
        dummyHeaderLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: 500, height: 100))
        dummyHeaderLabel.font = UIFont(name: "OpenSans-Semibold", size: 14)
        self.view.addSubview(dummyHeaderLabel)
        dummyHeaderLabel.isHidden = true
        dummyHeaderLabel.numberOfLines = 0
        self.mainTableView.register(UINib(nibName: "MyJDSubTypeCellWithPhotoTableViewCell", bundle: nil), forCellReuseIdentifier: "MyJDSubTypeCellWithPhotoTableViewCell")
        
        
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.estimatedSectionHeaderHeight = 60
        
        // Do any additional setup after loading the view.
        headerCollectionView.delegate = self
        headerCollectionView.dataSource = self
        
        
        if let urlParameters = urlParams,urlParameters.count > 0  {
           var paramsStr = ""
            for (key,value) in urlParameters {
                paramsStr = paramsStr.appending("&\(key)=\(value)")
                
            }
             urlString = "https://jdxperts.justdial.com/\(urlConfig)/get_sub_stage?city=\(GlobalData.city!.replacingOccurrences(of: " ", with: "%20"))&data_city=\(GlobalData.dataCity!.replacingOccurrences(of: " ", with: "%20"))&oid=\(currentOrderId)&wap=3" + paramsStr + GlobalData.defaultURL! + "&deviceid=\(upiData["device_id"] as? String ?? "")"
            if catid.length > 0 {
                urlString = "https://jdxperts.justdial.com/\(urlConfig)/get_sub_stage?city=\(GlobalData.city!.replacingOccurrences(of: " ", with: "%20"))&data_city=\(GlobalData.dataCity!.replacingOccurrences(of: " ", with: "%20"))&oid=\(currentOrderId)&wap=3&passCatid=\(catid)" + paramsStr + GlobalData.defaultURL! + "&deviceid=\(upiData["device_id"] as? String ?? "")"
            }
            
        }else{
            if catid.length > 0 {

                        urlString = "https://jdxperts.justdial.com/\(urlConfig)/get_sub_stage?passKey=catid&passValue=\(catid)&city=\(GlobalData.city!.replacingOccurrences(of: " ", with: "%20"))&data_city=\(GlobalData.dataCity!.replacingOccurrences(of: " ", with: "%20"))&oid=\(currentOrderId)&wap=3" + GlobalData.defaultURL! + "&deviceid=\(upiData["device_id"] as? String ?? "")"
            
                    }else{
            //            urlString = "https://jdxperts.justdial.com/\(urlConfig)/get_sub_stage?passKey=\(passKey)&passValue=\(passValue)&city=\(GlobalData.city!.replacingOccurrences(of: " ", with: "%20"))&oid=\(currentOrderId)&wap=3" + GlobalData.defaultURL! + "&deviceid=\(upiData["device_id"] as? String ?? "")"
                    }
        }
        
        self.picker.delegate = self
        self.picker.dataSource = self
        self.fetchSubsStageData()
    }
    
    
    @IBAction func donePickerViewAction(_ sender: Any) {
  
        //picker.selectedRow(inComponent: 0)
        if self.responseData!.dd[picker.selectedRow(inComponent: 0)].urlparams.count > 0 {
            var currentRow = self.picker.selectedRow(inComponent: 0)
            
            self.urlParams = self.responseData!.dd[currentRow].urlparams as! Dictionary<String, AnyObject>
            
            if let urlParameters = urlParams,urlParameters.count > 0  {
           var paramsStr = ""
            for (key,value) in urlParameters {
                paramsStr = paramsStr.appending("&\(key)=\(value)")
                
            }
             urlString = "https://jdxperts.justdial.com/\(urlConfig)/get_sub_stage?city=\(GlobalData.city!.replacingOccurrences(of: " ", with: "%20"))&data_city=\(GlobalData.dataCity!.replacingOccurrences(of: " ", with: "%20"))&oid=\(currentOrderId)&wap=3" + paramsStr + GlobalData.defaultURL! + "&deviceid=\(upiData["device_id"] as? String ?? "")"
                if catid.length > 0 {
                    urlString = "https://jdxperts.justdial.com/\(urlConfig)/get_sub_stage?city=\(GlobalData.city!.replacingOccurrences(of: " ", with: "%20"))&data_city=\(GlobalData.dataCity!.replacingOccurrences(of: " ", with: "%20"))&oid=\(currentOrderId)&wap=3&passCatid=\(self.catid)" + paramsStr + GlobalData.defaultURL! + "&deviceid=\(upiData["device_id"] as? String ?? "")"
                }
                self.loaderViewInitial.isHidden = false
               
                filterChosen = true
                self.fetchSubsStageData()
                
            
        }
        
        }
        
        
        showFilterView(false)
    
    
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.responseData?.dd.count ?? 0
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.self.responseData!.dd[row].lbl
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      //  self.textField.text = self.titles[row]
    }
    
    
    
    
    func setupNoteView(_ noteText : String){

        let footerVWhiteBG = UIView.init(frame: CGRect(x: -1, y: 0, width: UIScreen.main.bounds.size.width + 2, height: 64))
        
        footerVWhiteBG.backgroundColor = UIColor.white
          let footerV = UIView.init(frame: CGRect(x: -1, y: 0, width: UIScreen.main.bounds.size.width + 2, height: 44))
                  
                  footerV.layer.borderColor = UIColor.colorFromRGB(254, g: 215, b: 215).cgColor
                  footerV.layer.borderWidth = 1
                  footerV.layer.masksToBounds = true
                  footerV.backgroundColor = UIColor.white//UIColor.colorFromRGB(218, g: 79, b: 79)
                 // footerView.alpha = 0.08
                  
                   let footerViewBG = UIView.init(frame: CGRect(x: -1, y: 0, width: UIScreen.main.bounds.size.width + 2, height: 44))
                  footerViewBG.backgroundColor = UIColor.colorFromRGB(218, g: 79, b: 79)
                  footerViewBG.alpha = 0.08
                  footerV.addSubview(footerViewBG)
                  
                  let footerLabel = UILabel.init(frame: CGRect(x: 30, y: 0, width: UIScreen.main.bounds.size.width - 134, height: 44))
                  footerV.addSubview(footerLabel)
                  footerLabel.numberOfLines = 2
                  footerLabel.font = UIFont(name: "OpenSans", size: 13)
                  let footerText = "Note: \(noteText)"
                         let attributedString = NSMutableAttributedString(string: footerText, attributes: [
                    .font: UIFont(name: "OpenSans", size: 13.0),
                    .foregroundColor: UIColor.gunmetal
                  ])
                  attributedString.addAttribute(.foregroundColor, value: UIColor.colorFromRGB(218, g: 79, b: 79), range: NSRange(location: 0, length: 5))
                 //   footerLabel.backgroundColor = UIColor.veryLightPink
                  footerLabel.attributedText = attributedString
                  
                  
                    let rateCardButton = UIButton.init(frame: CGRect(x: UIScreen.main.bounds.size.width - 100, y: 7, width: 80, height: 30))
                  
                  rateCardButton.backgroundColor = UIColor.colorFromRGB(255, g: 108, b: 0)
                  rateCardButton.setTitle("Rate Card", for: .normal)
                  rateCardButton.titleLabel?.font = UIFont(name: "OpenSans-Semibold", size: 11.0)
                  rateCardButton.layer.cornerRadius = 5
                  rateCardButton.layer.masksToBounds = true
                  rateCardButton.setTitleColor(UIColor.white, for: .normal)
                  footerV.addSubview(rateCardButton)
                  rateCardButton.addTarget(self, action: #selector(self.rateCardRedirection(_:)), for: UIControl.Event.touchUpInside)
        footerVWhiteBG.translatesAutoresizingMaskIntoConstraints = false
        footerVWhiteBG.addSubview(footerV)
        
        self.view.addSubview(footerVWhiteBG)

        self.view.addConstraint(NSLayoutConstraint(item: footerVWhiteBG, attribute: .bottom, relatedBy: .equal, toItem: self.continueView, attribute: .top, multiplier: 1, constant: 0))

              
              self.view.addConstraint(NSLayoutConstraint(item: footerVWhiteBG, attribute: .trailingMargin, relatedBy: .equal, toItem: self.continueView, attribute: .trailingMargin, multiplier: 1, constant: 1))
              self.view.addConstraint(NSLayoutConstraint(item: footerVWhiteBG, attribute: .leadingMargin, relatedBy: .equal, toItem: self.continueView, attribute: .leadingMargin, multiplier: 1, constant: -1))
             noteHeightConstraint = NSLayoutConstraint(item: footerVWhiteBG, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 64)
        if self.continueBottomConstraint.constant == 0 {
            noteHeightConstraint?.constant = 50
        }
            noteHeightConstraint!.priority = UILayoutPriority(rawValue: 999)
              footerVWhiteBG.addConstraint(noteHeightConstraint!)
        
            self.view.layoutIfNeeded()
        mainTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        continueView.superview?.bringSubviewToFront(continueView)
        grayBG.superview?.bringSubviewToFront(grayBG)
        popUpMainView.superview?.bringSubviewToFront(popUpMainView)
        

        
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    //MARK: - TableView delegates
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if tableView == popUpTableView {
            if self.popUpFooterText.length == 0 {
              return 0
            }
            return 44
        
        }
        return 0
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
          if tableView == popUpTableView {
            if popUpFooterText.length == 0 {
                return nil
            }
            
            let footerView = UIView.init(frame: CGRect(x: -1, y: 0, width: UIScreen.main.bounds.size.width + 2, height: 44))
            
            footerView.layer.borderColor = UIColor.colorFromRGB(254, g: 215, b: 215).cgColor
            footerView.layer.borderWidth = 1
            footerView.layer.masksToBounds = true
            footerView.backgroundColor = UIColor.white//UIColor.colorFromRGB(218, g: 79, b: 79)
           // footerView.alpha = 0.08
            
             let footerViewBG = UIView.init(frame: CGRect(x: -1, y: 0, width: UIScreen.main.bounds.size.width + 2, height: 44))
            footerViewBG.backgroundColor = UIColor.colorFromRGB(218, g: 79, b: 79)
            footerViewBG.alpha = 0.08
            footerView.addSubview(footerViewBG)
            
            let footerLabel = UILabel.init(frame: CGRect(x: 30, y: 0, width: UIScreen.main.bounds.size.width - 110, height: 44))
            footerView.addSubview(footerLabel)
            footerLabel.numberOfLines = 2
            footerLabel.font = UIFont(name: "OpenSans", size: 13)
            let footerText = "Note: \(self.popUpFooterText)"
                   let attributedString = NSMutableAttributedString(string: footerText, attributes: [
              .font: UIFont(name: "OpenSans", size: 13.0),
              .foregroundColor: UIColor.gunmetal
            ])
            attributedString.addAttribute(.foregroundColor, value: UIColor.colorFromRGB(218, g: 79, b: 79), range: NSRange(location: 0, length: 5))
            
            footerLabel.attributedText = attributedString
            
            
              let rateCardButton = UIButton.init(frame: CGRect(x: UIScreen.main.bounds.size.width - 100, y: 7, width: 80, height: 30))
            
            rateCardButton.backgroundColor = UIColor.colorFromRGB(255, g: 108, b: 0)
            rateCardButton.setTitle("Rate Card", for: .normal)
            rateCardButton.titleLabel?.font = UIFont(name: "OpenSans-Semibold", size: 11.0)
            rateCardButton.layer.cornerRadius = 5
            rateCardButton.layer.masksToBounds = true
            rateCardButton.setTitleColor(UIColor.white, for: .normal)
            footerView.addSubview(rateCardButton)
            rateCardButton.addTarget(self, action: #selector(self.rateCardRedirection(_:)), for: UIControl.Event.touchUpInside)
            return footerView
              
              }
              return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        if tableView == mainTableView {
        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "collectionHeader") {
            
            if let label = headerView.viewWithTag(100) as? UILabel {
                if responseData != nil, let title = responseData!.data[section].key as? String {
                    label.text = title
                    label.frame = CGRect(x: 20, y: 0, width: UIScreen.main.bounds.width - 40, height: 60)
                
                }
                
            }

            if let bannerView = headerView.viewWithTag(200) as? MyJDSubStageSectionHeaderView {
                

                bannerView.imageV.image = nil

                if responseData != nil, let imgStr = responseData!.data[section].banner["img"], imgStr.length > 0, let aspRatio = responseData!.data[section].banner["aspratio"], let label = headerView.viewWithTag(100) as? UILabel {
                    
                    
                    
                    let bannerheight = getBannerHeightForAsepctRatio(aspRatio)
                    bannerView.imageHeightContraint.constant = bannerheight

                    bannerView.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: bannerheight)
                    headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: bannerheight + 60 + 40)
                    label.frame = CGRect(x: 20, y: bannerheight + 20, width: UIScreen.main.bounds.width - 40, height: 60)
                    let heightConstraint = NSLayoutConstraint(item: bannerView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: bannerheight)
                     
                     let widthConstraint = NSLayoutConstraint(item: bannerView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: self.view.frame.size.width)
                     
                     NSLayoutConstraint.activate([heightConstraint, widthConstraint,   NSLayoutConstraint(item: bannerView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: headerView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 20)])
                     bannerView.imageHeightContraint.constant = bannerheight
                    bannerView.imageV.sd_setImage(with: URL(string: imgStr), placeholderImage: UIImage(named: "no_image"))
                    
                }else{
                    bannerView.imageHeightContraint.constant = 0

                    bannerView.isHidden = true
                    
                    
                }
                           
                
                
                
                
            }
            if let label = headerView.viewWithTag(100) as? UILabel {

                label.superview?.bringSubviewToFront(label)
            }
            return headerView
            
        }else{
          
            
            
            let headerView = UITableViewHeaderFooterView.init(reuseIdentifier: "collectionHeader")
            
            headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200)
           // headerView.reuseIdentifier = "collectionHeader"
            let label = UILabel.init(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.width - 40, height: 60))
            label.font = UIFont(name: "OpenSans-Bold", size: 20)
            headerView.addSubview(label)
            label.tag = 100
            if responseData != nil, let title = responseData!.data[section].key as? String {
                label.text = title
            
            
            }
            
            let bannerView = MyJDSubStageSectionHeaderView().instanceFromNib(self) as! MyJDSubStageSectionHeaderView
            bannerView.translatesAutoresizingMaskIntoConstraints = false
            bannerView.frame = CGRect.zero
            bannerView.imageHeightContraint.constant = 0
            bannerView.tag = 200
            headerView.addSubview(bannerView)
            bannerView.isUserInteractionEnabled = true
              let tapgesture = UITapGestureRecognizer(target: self, action: #selector(self.safetyRedirect(_:)))
                tapgesture.numberOfTapsRequired = 1
              bannerView.addGestureRecognizer(tapgesture)
            bannerView.imageV.image = nil

            if responseData != nil, let imgStr = responseData!.data[section].banner["img"], imgStr.length > 0, let aspRatio = responseData!.data[section].banner["aspratio"] {
                let bannerheight = getBannerHeightForAsepctRatio(aspRatio)

               let heightConstraint = NSLayoutConstraint(item: bannerView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: bannerheight)
                
                let widthConstraint = NSLayoutConstraint(item: bannerView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: self.view.frame.size.width)
                
                 NSLayoutConstraint.activate([heightConstraint, widthConstraint,   NSLayoutConstraint(item: bannerView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: headerView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 20)])
                bannerView.imageHeightContraint.constant = bannerheight

           //     bannerView.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: bannerheight)
            //    bannerView.translatesAutoresizingMaskIntoConstraints = true
                headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: bannerheight + 60 + 40)
                label.frame = CGRect(x: 20, y: bannerheight + 20, width: UIScreen.main.bounds.width - 40, height: 60)
                bannerView.imageV.sd_setImage(with: URL(string: imgStr), placeholderImage: UIImage(named: "no_image"))


            }
            
            
            
            
            
            
            
            
            
            headerView.clipsToBounds = true
            headerView.layoutIfNeeded()
            if let label = headerView.viewWithTag(100) as? UILabel {

                         label.superview?.bringSubviewToFront(label)
                     }
            return headerView
            
        }
        }
        
        return nil
        
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.layoutIfNeeded()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == mainTableView {
            if responseData != nil, let imgStr = responseData!.data[section].banner["img"], imgStr.length > 0, let aspRatio = responseData!.data[section].banner["aspratio"] {
                return getBannerHeightForAsepctRatio(aspRatio) + 70

            }else{
                return 60
            }

        }
        return 0
    }
    
    @objc func safetyRedirect(_ sender : UITapGestureRecognizer){
        
//        print("Tapped")
//        let vc = UIStoryboard(name: "categoryLanding", bundle: nil).instantiateViewController(withIdentifier: "SafetyMeasuresViewController") as? SafetyMeasuresViewController
//        rootNavigationController.pushViewController(vc!, animated: true)
        
        
        
    }
    
    
    
    func getBannerHeightForAsepctRatio(_ aspectRatio : String) -> CGFloat {
        
        if aspectRatio.contains(":") {
            let arr = aspectRatio.components(separatedBy: ":")
                if arr.count == 2 {
                    
                    if let arrWidth = NumberFormatter().number(from: arr[0]), let arrHeight = NumberFormatter().number(from: arr[1]) {
                        return (self.view.frame.size.width - 40) * (CGFloat(arrHeight)/CGFloat(arrWidth))
                    }
                    
                }
            
        }
        return 100
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == mainTableView {
          if responseData != nil {
                  return responseData!.data.count
              }else{
                  return 0
              }
        }else{
         return 1
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == mainTableView {
        if responseData != nil {

            return responseData!.data[section].result.count
            
        }else{
            return 0
        }
        }else if tableView == popUpTableView {
            
            return popUpResultsArray.count
            
        }else{
            
         return 0
        }
        
      }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == mainTableView {
        return getHeightOfCell(indexPath) + 14
        }else{
         return 54
        }
    }
    
    @objc func rateCardRedirection(_ sender : UIButton) {
        
        
//        let vc = UIStoryboard(name: "ODSRateCard", bundle: nil).instantiateViewController(withIdentifier: "ODSRateCardViewController") as! ODSRateCardViewController
//        if let currentContinueObject = self.currentPrevOrder, currentContinueObject.ncatid.length > 0 {
//
//        vc.ncatid = currentContinueObject.ncatid
//            vc.extendLayoutToFull = true
//        navigationController?.pushViewController(vc, animated: true)
//
//        }
        
    }
    
     func fetchSubsStageData(){
            
            
            HttpUtils.getJSONRequest(self.urlString, targetViewController: self) { (responseObject, error) -> Void in
                       if (responseObject != nil) {

                      //  print(responseObject)
                        self.loaderViewInitial.isHidden = true
                        self.responseData = Mapper<MyJDSubStageModel>().map(JSONObject: responseObject)
                       
                        
                        if self.responseData != nil {
                            if self.responseData!.header != ""{
                                self.catTitle = self.responseData!.header
                                self.topTitleLabel.text = self.responseData!.header
                            }
                            if self.responseData!.footerText.length > 0 {
                                self.setupNoteView(self.responseData!.footerText)
                                
                            }
                            
                            for localObj in self.responseData!.data {
                               
                                for subLocalObj in localObj.result {
                                    if subLocalObj.qty > 0 {
                                        self.currentSelectedServiceDict["\(subLocalObj.sId)"] = subLocalObj.qty as AnyObject
                                        
                                    }
                                    
                                }
                                
                                
                                
                                
                            }
                        
                        
                        
                        }
                        //if mon
                        //self.currentSection =
                        
                        /*
                         
                         var err_code : Int = 0
                         var currServices : [MyJDCurrServicesModel] = []
                         var popUp : Int = 0
                         var results : [MyJDCurrentSelectedServicesResultModel] = []
                         var nextPage : String = ""
                         
                         */
                        //self.currentServicesObje
                       // MyJDCurrentSelectedServicesModel
    //                    if let prevOrderDetails = self.responseData?.prevOrder {
    //
    //                        self.currentServicesObject = self.getSelectedCurrentServicesFromPrevOrder(prevOrderDetails)
    //
    //                        self.showContinueButton(true)
    //                    }
                        self.currentPrevOrder =  self.responseData?.prevOrder
                        if let cPrevOrder = self.currentPrevOrder {
                            self.currentOrderId = cPrevOrder.oid
                        }
                        self.showContinueButton(true)
                        
                        
                        self.mergeMainApitosDesc(self.responseData)
                        
                        
                        
                        
                        
                        
                        
                        self.mainTableView.reloadData()
                        let visibleCellsIndexPaths = self.mainTableView.indexPathsForVisibleRows
                        if visibleCellsIndexPaths != nil && visibleCellsIndexPaths!.count > 0 {
                            
                            self.currentSection = self.responseData!.data[visibleCellsIndexPaths![0].section]
                            
                        }
                        
                        
                        self.headerCollectionView.reloadData()
                        self.picker.reloadAllComponents()

                        if self.responseData != nil && self.responseData!.data.count < 2 {
                            self.headerCollectionView.isHidden = true
                            self.mainHeaderHeightConstraint.constant = 60
                            self.view.layoutIfNeeded()
                        }
                        
                        self.initialScrollSetup()
                        
                        
                        
                        //currentSection
                        
                        
            
                        
                }
                
                
                
            }
            
        }
    
    func initialScrollSetup(){
        
        if filterChosen {
            filterChosen = false
            if responseData != nil && responseData!.data.count > 0 {
                delay(0.2) {
//                         if #available(iOS 11.0, *) {
//                            let desiredOffset = CGPoint(x: 0, y: -self.mainTableView.adjustedContentInset.top)
//                        self.mainTableView.setContentOffset(desiredOffset, animated: false)
//                    }else{
//                    let desiredOffset = CGPoint(x: 0, y: -self.mainTableView.contentInset.top)
//                    self.mainTableView.setContentOffset(desiredOffset, animated: false)
//                    }
//                self.scrollHeaderCollectionToSection(0, animated: false)
                    if self.headerCollectionView.numberOfSections > 1 && self.headerCollectionView.numberOfItems(inSection: 1) > 0 {
                          self.scrollHeaderCollectionToSection(0, animated: true, fixToZero: true)
                      }
                    self.mainTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
                //    self.setSelectedSection()
  
                
                
                }
            }
            return
        }
        
        
        
        if !initialScrollSet {
            initialScrollSet = true
            if responseData != nil {
                if self.catid.length > 0 {
                    var index = 0
                for obj in responseData!.data {
                    if self.catid == obj.catid {
                        
                        
                        break
                    }
                    index = index + 1
                    
                    
                }
                    if index != 0 && index < self.responseData!.data.count{
                        delay(0.5) {
                            self.scrollHeaderCollectionToSection(index, animated: true, fixToZero: false)
                            self.collectionView(self.headerCollectionView, didSelectItemAt: IndexPath(item: index, section: 1))
                           //  self.headerCollectionView.selectItem(at: IndexPath(item: index, section: 0), animated: true, scrollPosition: .centeredHorizontally)
                        }
                       
                        
                    }else{
//                        delay(0.5) {
//                            if 
//                            self.scrollHeaderCollectionToSection(0)
//                            self.collectionView(self.headerCollectionView, didSelectItemAt: IndexPath(item: index, section: 1))
//                           //  self.headerCollectionView.selectItem(at: IndexPath(item: index, section: 0), animated: true, scrollPosition: .centeredHorizontally)
//                        }

                    }
                    
                }
                
            }
            
            
            
            
            
            
            
            
        }
        
    }
    
    func getHeaderWidth(_ str : String) -> CGFloat {
        self.dummyHeaderLabel.text = str
        return self.dummyHeaderLabel.intrinsicContentSize.width
        
    }
    
    
     func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text

        label.sizeToFit()
        //print("\nheight - \(label.frame.height) - \(text)")
        return label.frame.height
    }
    
    func getHeightOfCell(_ indexPath : IndexPath) -> CGFloat {
        
     let obj : MyJDSubStageDataResultElement = responseData!.data[indexPath.section].result[indexPath.row]
       
        var totalHeight : CGFloat = 24
        
        if obj.sName.length > 0 {
            dummyServiceNameLabel.text = obj.sName
            if obj.hotsellerText.length > 0 {
                dummyServiceNameLabel.preferredMaxLayoutWidth = self.view.frame.size.width - 166 - 60

            }else{
                dummyServiceNameLabel.preferredMaxLayoutWidth = self.view.frame.size.width - 166

            }

            totalHeight = totalHeight + dummyServiceNameLabel.intrinsicContentSize.height
        }
        
        if obj.sMrpPrice > 0 || obj.sOfferPrice > 0 {
            totalHeight = totalHeight + 22 + 4

            
        }else{
            totalHeight = totalHeight + 4

            
        }
        if obj.sDuration.length > 0 {
            
            totalHeight = totalHeight + 22 + 4

        }else{
            
            totalHeight = totalHeight + 4

        }
        
        if obj.sSdimg.count > 0 {
            totalHeight = totalHeight + 40 + 6
        }else{
            totalHeight = totalHeight + 6

        }
        var descFlag = false
        var midDividerPresent = false
        for objLocal in obj.sDesc {
            descFlag = true
            totalHeight = totalHeight + 10 + self.heightForView(text: "\(objLocal.description)" != "" ? "\(objLocal.title) - \(objLocal.description)" : "\(objLocal.title)", font: UIFont(name: "OpenSans", size: 13) ?? UIFont.systemFont(ofSize: 13), width: UIScreen.main.bounds.size.width - 92)
            if objLocal.lineBelow {
                midDividerPresent = true
            }
        }
        if midDividerPresent {
          totalHeight = totalHeight + 24
        }
        if obj.viewDetails == 1 {
            
            totalHeight = totalHeight + 40
        }
        if descFlag {
            totalHeight = totalHeight + 24

        }
        totalHeight = totalHeight + 20

        
    return totalHeight
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == mainTableView {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyJDSubTypeCellWithPhotoTableViewCell", for: indexPath) as! MyJDSubStageTableCell
            let obj : MyJDSubStageDataResultElement = responseData!.data[indexPath.section].result[indexPath.row]
            cell.servicename.text = obj.sName
            cell.currentParentRow = indexPath.row
            
            if let gPeriodText = obj.gPeriod["text"], gPeriodText.length > 0 {
                cell.guaranteeLabel.isHidden = false
                
                cell.guaranteeLabel.text = "  \(gPeriodText)  "
            }else{
                cell.guaranteeLabel.isHidden = true
            }
            if var gPeriodText = obj.gPeriod["color"], gPeriodText.length > 5 && gPeriodText.length < 8 {
               // gPeriodText = gPeriodText.stringByReplacingFirstOccurrenceOfString(target: "#", withString: "")
                cell.guaranteeLabel.backgroundColor = hexStringToUIColor(hex: gPeriodText)
            }
            
            cell.serviceNameString = obj.sName
            if obj.sDesc.count > 0 {
                cell.dottedLineViewHeight.constant = 24
            }else{
                cell.dottedLineViewHeight.constant = 0
                
            }
            cell.descriptionArray = obj.sDesc
            
            
            if obj.sOfferPrice > 0 {
                
                var sOfferPriceStr =  "\(obj.sOfferPrice)"
                
                if floor(obj.sOfferPrice) == obj.sOfferPrice {
                    if let intOfferPrice = CLong(obj.sOfferPrice) as? CLong {
                        sOfferPriceStr = "\(intOfferPrice)"
                    }
                    
                }
                
                cell.mrpPriceLabel.text = "₹\(sOfferPriceStr)"
                
                
                var mrpStr =  "\(obj.sMrpPrice)"
                
                if floor(obj.sMrpPrice) == obj.sMrpPrice {
                    if let intmrpPrice = CLong(obj.sMrpPrice) as? CLong {
                        mrpStr = "\(intmrpPrice)"
                    }
                    
                }
                
                
                let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "₹\(mrpStr)")
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
                cell.discountedPriceLabel.attributedText = attributeString
                
                
            }else{
                var mrpStr =  "\(obj.sMrpPrice)"
                
                if floor(obj.sMrpPrice) == obj.sMrpPrice {
                    if let intmrpPrice = CLong(obj.sMrpPrice) as? CLong {
                        mrpStr = "\(intmrpPrice)"
                    }
                    
                }
                
                cell.mrpPriceLabel.text = "₹\(mrpStr)"
                cell.discountedPriceLabel.attributedText = nil
            }
            if !(obj.sMrpPrice > 0 || obj.sOfferPrice > 0) {
                
                cell.mrpPriceLabelHeight.constant = 0
            }else{
                
                cell.mrpPriceLabelHeight.constant = 22
                
            }
            
            
            cell.timeButton.setTitle(obj.sDuration, for: .normal)
            
            if (obj.sDuration.length == 0 ){
                cell.timeButtonHeight.constant = 0
            }else{
                cell.timeButtonHeight.constant = 22
                
                
            }
            cell.photoUrlArray = obj.sSdimg
            cell.descriptionTableView.reloadData()
            cell.photoCollectionView.reloadData()
            if obj.sSdimg.count > 0 {
                cell.photoHeightConstraint.constant = 40
                
            }else{
                
                cell.photoHeightConstraint.constant = 0
                
            }
            if currentSelectedServiceDict["\(obj.sId)"] != nil {
                cell.addButton.isHidden = true
                cell.plusButton.isHidden = false
                cell.minusButton.isHidden = false
                cell.quantityLabel.text = "\(currentSelectedServiceDict["\(obj.sId)"]!)"
                
            }else{
                cell.addButton.isHidden = false
                cell.plusButton.isHidden = true
                cell.minusButton.isHidden = true
                cell.quantityLabel.text = ""
                
            }
            
            if !cell.targetsSet {
                cell.targetsSet = true
                cell.viewDetailsButton.addTarget(self, action: #selector(self.viewDetailsAction(_:)), for: UIControl.Event.touchUpInside)
                cell.addButton.addTarget(self, action: #selector(self.plusAction(_:)), for: UIControl.Event.touchUpInside)
                cell.plusButton.addTarget(self, action: #selector(self.plusAction(_:)), for: UIControl.Event.touchUpInside)
                cell.minusButton.addTarget(self, action: #selector(self.minusAction(_:)), for: UIControl.Event.touchUpInside)
            }
            cell.viewDetailsButton.accessibilityValue = "\(indexPath.section)"
            cell.viewDetailsButton.accessibilityIdentifier = "\(indexPath.row)"
            
            cell.addButton.accessibilityValue = "\(indexPath.section)"
            cell.addButton.accessibilityIdentifier = "\(indexPath.row)"
            
            cell.plusButton.accessibilityValue = "\(indexPath.section)"
            cell.plusButton.accessibilityIdentifier = "\(indexPath.row)"
            
            cell.minusButton.accessibilityValue = "\(indexPath.section)"
            cell.minusButton.accessibilityIdentifier = "\(indexPath.row)"
            if obj.viewDetails == 1 {
                cell.bottomViewDetailsView.isHidden = false
            }else{
                cell.bottomViewDetailsView.isHidden = true
                
            }
            
            //            if indexPath.row == 0 {
            //                scrollHeaderCollectionToSection(indexPath.section)
            //
            //            }
            if obj.hotsellerText.length == 0 {
                cell.hotsellerLabel.text = ""
                
                cell.hotsellerImageWidth.constant = 0
            }else{
                cell.hotsellerLabel.text = "  \(obj.hotsellerText)  "
                
                cell.hotsellerImageWidth.constant = 10
                
            }
            
            if !scrollCheckDisabled {
                
                
                self.setSelectedSection()
            }
            
            
            return cell
        }else if tableView == popUpTableView {
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyJDSubStagePopupCell", for: indexPath) as! MyJDSubStagePopupCell
            cell.selectionStyle = .none
            cell.issueLabel.text = popUpResultsArray[indexPath.row]["text"]
            
            cell.bgView.backgroundColor = UIColor.white
            cell.bgView.layer.borderColor = UIColor.colorFromRGB(228, g: 234, b: 239).cgColor
            cell.bgView.layer.borderWidth = 2
            cell.bgView.layer.masksToBounds = true
            cell.issueLabel.textColor = UIColor.colorFromRGB(65, g: 78, b: 90)
            if let selected = popUpResultsArray[indexPath.row]["selected"], selected == "1" {
                cell.issueLabel.textColor = UIColor.white
                cell.bgView.backgroundColor = UIColor.colorFromRGB(52, g: 200, b: 90)
                cell.bgView.layer.borderWidth = 0
            }
            
            
            
            return cell
            
            
        }else{
            
            return UITableViewCell.init()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView == mainTableView {
        if !scrollCheckDisabled {
        
        
        self.setSelectedSection()
        }
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == mainTableView {
            
            addButtonInProgressFlag = false
            
        }
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
         var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
         
         if (cString.hasPrefix("#")) {
             cString.remove(at: cString.startIndex)
         }
         
         if ((cString.count) != 6) {
             return UIColor.gray
         }
         
         var rgbValue:UInt32 = 0
         Scanner(string: cString).scanHexInt32(&rgbValue)
         
         return UIColor(
             red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
             green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
             blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
             alpha: CGFloat(1.0)
         )
     }
    
    
    
    func setSelectedSection(){
       
        if addButtonInProgressFlag {
            return
        }
        
        if filterChosen {
            return
        }
       print("setSelectedSection called")
        if let indexPaths = self.mainTableView.indexPathsForVisibleRows {
            var totSection : Float = 0
            //var cnt =
            
            for iPs in indexPaths {
                if iPs.row == 0 && iPs.section == 0 {
                    totSection = 0
                    break
                }
                totSection = totSection + Float(iPs.section)
                
            }
            totSection = totSection / Float(indexPaths.count)
            let section = ceil(totSection)
            if Int(section) < responseData!.data.count {
            self.scrollHeaderCollectionToSection(Int(section), animated: true, fixToZero: false)
            }
            
            
        }
        
        
        
        
    }
    
    
    @IBAction func continueAction(_sender : UIButton) {
        //clickTracker("continue", ll: "ods_servicepage_\(self.ncatid)", vid: "")

          if let currentContinueObject = self.currentPrevOrder {
              
            if currentContinueObject.proceed == 0 {
                return
            }
            
              switch currentContinueObject.nextPage {
              case "covid_pg":
//                let covidVC = UIStoryboard(name: "ODSSummary", bundle: nil).instantiateViewController(withIdentifier: "ODSCovidDisclaimerPage") as! ODSCovidDisclaimerPage
//
//                covidVC.oid = currentContinueObject.oid
//                covidVC.ncatid = currentContinueObject.ncatid
//                covidVC.catTitle = self.catTitle
//                self.navigationController?.pushViewController(covidVC, animated: true)
                break
              case "add_on_pg":
                  let notificationVc = UIStoryboard(name: "MyJDSubStageStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "MyJDSubStageAddOnController") as! MyJDSubStageAddOnController
                  
                  notificationVc.orderId = currentContinueObject.oid
                  notificationVc.ncatid = currentContinueObject.ncatid
                  
                  notificationVc.currentServicesObject = self.currentServicesObject
                  notificationVc.currentPrevOrder = self.currentPrevOrder
                  notificationVc.parentSubStageVC = self
                  notificationVc.catTitle = self.catTitle
                  self.navigationController!.pushViewController(notificationVc, animated: true)
                  break
              case "summary_pg":
                if currentContinueObject.proceed == 0 {
                    return
                }
//                let summaryPage = UIStoryboard(name: "ODSSummary", bundle: nil).instantiateViewController(withIdentifier: "ODSSummaryViewControllerBeforePG") as! ODSSummaryViewControllerBeforePG
//                summaryPage.orderID = currentContinueObject.oid
//                summaryPage.ncatid = currentContinueObject.ncatid
//                if let orderDetails = self.currentPrevOrder?.orderDetails {
//                    for obj in orderDetails {
//                        summaryPage.catTitle = obj.rootCatName
//                        break
//                    }
//                }

              //    self.navigationController?.pushViewController(summaryPage, animated: true)
                  break
              default:
                  break
              }
              
              

              
          }
         
      
      }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.layoutIfNeeded()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == popUpTableView {
          
            var tempArray : Array<Dictionary<String, String>> = []
            var i = 0
            for var obj in self.popUpResultsArray {
                if indexPath.row == i {
                    obj["selected"] = "1"
                    
                }else{
                    
                    obj["selected"] = "0"

                }
                tempArray.append(obj)
                i = i + 1
            }
            self.popUpResultsArray = tempArray
            self.popUpTableView.reloadData()
            
            
        }
        
        
    }
    
  
    
    
    @objc func viewDetailsAction(_ sender : UIButton) {
          
          if let section = sender.accessibilityValue, let row = sender.accessibilityIdentifier {
              if let sectionInt = Int(section), let rowInt = Int(row) {
              
             let obj : MyJDSubStageDataResultElement = responseData!.data[sectionInt].result[rowInt]
                
                let vc = UIStoryboard(name: "MyJDSubStageStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "MyJDSubStageViewDetailsVC") as! MyJDSubStageViewDetailsVC
                vc.nCatTitle = self.catTitle
                vc.ncatid = self.ncatid
                vc.sid = "\(obj.sId)"
                vc.orderId = self.currentOrderId
                self.navigationController?.pushViewController(vc, animated: true)
                  
                
            }
            
        }
        
    }
    
    @objc func plusAction(_ sender : UIButton) {
         
        
        cancelAndFireNewToast("Xperts - Add button Tapped")
        
        
        
        if let section = sender.accessibilityValue, let row = sender.accessibilityIdentifier {
            cancelAndFireNewToast("Xperts - Add button Tapped C - 1")

            if let sectionInt = Int(section), let rowInt = Int(row) {
                cancelAndFireNewToast("Xperts - Add button Tapped C - 2")

           let obj : MyJDSubStageDataResultElement = responseData!.data[sectionInt].result[rowInt]
            var currentQty = 1

                if currentSelectedServiceDict["\(obj.sId)"] != nil {
                    if var prevQty : CLong = CLong("\(currentSelectedServiceDict["\(obj.sId)"]!)") {
                        cancelAndFireNewToast("Xperts - Add button Tapped C - 3")

                        currentQty = prevQty + 1
                    }
                    
                }
                cancelAndFireNewToast("Xperts - Add button Tapped C - 4")

                addButtonInProgressFlag = true
                
                self.callOrderIdUpdate("\(obj.sId)", qty: "\(currentQty)", orderID: self.currentOrderId, ncatid: responseData!.ncatid, popupinfo: "")
                
                
                
                
                
                
                
            }
            
            
        }
        
        
    }
    
    
    func updatePrevOrder(_ obj : MyJDSubStagePrevOrderModel){
        
        self.currentPrevOrder = obj
        self.showContinueButton(true)
        
    }
    
    
    func callOrderIdUpdate(_ sid : String, qty : String, orderID : String, ncatid : String, popupinfo : String){
        var sDetail = ["sId" : sid, "qty" : qty]
            var subfilterLocal = "[{\"sId\":\"\(sid)\",\"qty\":\(qty)}]".URLEncodedString()!
        subfilterLocal = subfilterLocal.replacingOccurrences(of: ":", with: "%3A")
          
        
        let orderIdUpdateApi = "https://jdxperts.justdial.com/\(urlConfig)/add_cart?sDetail=\(subfilterLocal)&ncatid=\(ncatid)&oid=\(orderID)&popupinfo=\(popupinfo)&wap=3&city=\(GlobalData.city!.replacingOccurrences(of: " ", with: "%20"))&data_city=\(GlobalData.dataCity!.replacingOccurrences(of: " ", with: "%20"))" + GlobalData.defaultURL! + "&deviceid=\(upiData["device_id"] as? String ?? "")"
        
        HttpUtils.getJSONRequest(orderIdUpdateApi, targetViewController: self) { (responseObject, error) -> Void in
            if (responseObject != nil) {
                
                
                if let err_code = responseObject!["err_code"] as? Int, err_code != 0 {
                    
                    if let errMsg = responseObject!["msg"] as? String {
                        UIApplication.shared.keyWindow!.hideAllToasts()
                        
                        UIApplication.shared.keyWindow!.makeToast(errMsg)
                        
                    }
                    self.addButtonInProgressFlag = false
                    
                    return
                    
                    
                }
                
                
                
                //  print("\n result - \(responseObject)")
                
                if responseObject!["popUp"] != nil && "\(responseObject!["popUp"]!)" == "1"  {
                    
                    self.popUpDictionary = responseObject as! Dictionary<String, AnyObject>
                    
                    self.showPopUp(true)
                    
                    
                }else{
                    self.currentServicesObject = Mapper<MyJDCurrentSelectedServicesModel>().map(JSONObject: responseObject)
                    
                    var currentSelectedServiceDictLocal : Dictionary<String, AnyObject> = [:]
                    
                    for currServicesObj in self.currentServicesObject!.currServices {
                        currentSelectedServiceDictLocal[currServicesObj.service_id] = currServicesObj.qty as AnyObject
                        
                    }
                    
                    self.currentSelectedServiceDict = currentSelectedServiceDictLocal
                    
                    if let currentServiceObject = self.currentServicesObject {
                        let results = currentServiceObject.results
                        if results.count > 0 {
                            self.currentOrderId = results[0].oid
                            
                        }
                        if let prevOrder = currentServiceObject.prevOrder {
                            
                            self.updatePrevOrder(prevOrder)
                            
                        }
                        
                    }
                    self.mergecurrServicestosDesc(self.currentServicesObject!.currServices)
                    // self.mainTableView.reloadData()
                    let generator = UISelectionFeedbackGenerator()
                    generator.selectionChanged()
                    self.showContinueButton(true)
                    var objectTosend : [String:Any] = [:]
                    if let temp1 = (responseObject as? [String:Any])?["prevOrder"] as? [String:Any] {
                        let prevOrderObject : MyJDSubStagePrevOrderModel? = Mapper<MyJDSubStagePrevOrderModel>().map(JSON: temp1)
                        if let _ = prevOrderObject {
                            objectTosend.updateValue(prevOrderObject!, forKey: "prevOrder")
                        }
                    }
                    var currServices : [MyJDCurrServicesModel] = []
                    if let temp2 = (responseObject as? [String:Any])?["currServices"] as? [[String:Any]] {
                        for i in temp2 {
                            if let t = Mapper<MyJDCurrServicesModel>().map(JSON: i) {
                                currServices.append(t)
                            }
                        }
                    }
                    objectTosend.updateValue(currServices, forKey: "currServices")
                    objectTosend.updateValue(self, forKey: "originVC")
                    NotificationCenter.default.post(name: Notification.Name("myJDOrderModified"), object: objectTosend)
                    
                    
                }
                
                self.addButtonInProgressFlag = false
                
            }else{
                self.addButtonInProgressFlag = false
                
            }
            
            
            
        }
        
        
        
        
        
        
    }
    //mergecurrServicestosDesc
    
    func mergecurrServicestosDesc (_ responseObj : [MyJDCurrServicesModel]) {
        
        //MyJDSubStageDataResultsDescModel
    
        if var newSubStageModel = self.responseData as? MyJDSubStageModel {
                   var dataCount = 0
                   for dataObj in self.responseData!.data {
                       var resultCount = 0
                       
                       for resultObj in dataObj.result {
                           var newsDesc : [MyJDSubStageDataResultsDescModel] = []
                        
                        for obj in responseObj {
                               if self.responseData!.data[dataCount].result[resultCount].sId == obj.service_id {
                                    var count = 0
                                   for str in obj.addedText {
                                       let newObj = MyJDSubStageDataResultsDescModel.init("", description: str, subTextFlag: true)
                                    
                                    if count == (obj.addedText.count - 1) {
                                        if resultObj.sDesc.count > 0 {
                                            newObj.lineBelow = true
                                        }
                                    }
                                    
                                       newsDesc.append(newObj)
                                    count = count + 1
                                   }
                                   
                               }
                               
                           }
                           for sDescObj in resultObj.sDesc {
                               if !sDescObj.subTextFlag {
                                   
                                   newsDesc.append(sDescObj)
                               }
                           }
   
                           self.responseData!.data[dataCount].result[resultCount].sDesc = newsDesc
                          resultCount = resultCount + 1
                       }
                   dataCount = dataCount + 1
                   }
                   
               
               
               
               }
        
    }
    
    
    func mergeMainApitosDesc(_ responseObj : MyJDSubStageModel?){
        if var newSubStageModel = responseObj as? MyJDSubStageModel {
            var dataCount = 0
            for dataObj in responseObj!.data {
                var resultCount = 0
                
                for resultObj in dataObj.result {
                    var newsDesc : [MyJDSubStageDataResultsDescModel] = []
                    var count = 0
                    for prevOrderDescObj in resultObj.prevOrder {
                        prevOrderDescObj.description = prevOrderDescObj.text
                        prevOrderDescObj.subTextFlag = true
                        if count == (resultObj.prevOrder.count - 1) {
                            if resultObj.sDesc.count > 0 {
                                prevOrderDescObj.lineBelow = true
                            }
                        }
                        newsDesc.append(prevOrderDescObj)

                        count = count + 1
                        
                    }

                    for sDescObj in resultObj.sDesc {
                        if !sDescObj.subTextFlag {
                            
                            newsDesc.append(sDescObj)
                        }
                    }

                    self.responseData!.data[dataCount].result[resultCount].sDesc = newsDesc
                   resultCount = resultCount + 1
                }
            dataCount = dataCount + 1
            }
            
        
        
        
        }
        
    }
    
    
    @objc func closeDetails(_ sender : UITapGestureRecognizer) {
        
        
        self.showPopUp(false)
    
    
    }
    
    
    func showPopUp(_ flag : Bool){
        
        
        if flag {
            if let popUpDict = popUpDictionary, popUpDict["results"] != nil &&  popUpDict["results"] is Array<Dictionary<String, String>>{
                
                var tempArray : Array<Dictionary<String, String>> = []
                self.popUpResultsArray = popUpDict["results"] as! Array<Dictionary<String, String>>
                
                for var obj in self.popUpResultsArray {
                    
                    obj["selected"] = "0"
                    tempArray.append(obj)
                    
                }
                self.popUpResultsArray = tempArray
                
                
                
                //  self.popUpResultsArray =
                
                if self.popUpResultsArray.count > 0 {
                    if let title1 = popUpDict["headerText"] as? String {
                        self.popUpTitle1.text = title1
                    }else{
                        self.popUpTitle1.text = ""
                        
                    }
                    
                    if let title2 = popUpDict["subText"] as? String {
                        self.popUpTitle2.text = title2
                    }else{
                        self.popUpTitle2.text = ""
                    }
                    //popUpFooterText
                    if let footerTextPopUp = popUpDict["footerText"] as? String {
                        self.popUpFooterText = footerTextPopUp
                    }else{
                        self.popUpFooterText = ""
                    }
                    
                    self.popUpTableView.reloadData()
                    self.popUpBottomConstraint.constant = -20
                    self.grayBG.isHidden = false
                    
                    UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                        self.grayBG.alpha = 0.5
                        //   self.grayBG.alpha = 0.6
                        self.view.layoutIfNeeded()
                        
                        
                        
                    }) { (complete : Bool) in
                    }
                    
                    return
                    
                    
                }
                
                
            }
            
            
        }
        
        self.popUpBottomConstraint.constant = -self.popUpHeightinFloat - 20
        self.filterPickerBottomConstraint.constant = -280

        
        
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            
               self.grayBG.alpha = 0
            self.view.layoutIfNeeded()
            
            
            
        }) { (complete : Bool) in
            self.grayBG.isHidden = true
            
        }
        
        
    }
    
    
    func showFilterView(_ flag : Bool) {
        
        if flag {
           
            
            
            self.filterPickerBottomConstraint.constant = 0
            self.grayBG.isHidden = false

            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                
                self.grayBG.alpha = 0.5
                self.view.layoutIfNeeded()
                
                
                
            }) { (complete : Bool) in
                
            }
            
            
            
        }else{
            self.popUpBottomConstraint.constant = -self.popUpHeightinFloat - 20
            
            self.filterPickerBottomConstraint.constant = -280

            
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                
                   self.grayBG.alpha = 0
                self.view.layoutIfNeeded()
                
                
                
            }) { (complete : Bool) in
                self.grayBG.isHidden = true
                
            }
            
            
        }
        
    }
    
    
    
    
    @IBAction func popUpDone(_sender : UIButton) {

        
        self.showPopUp(false)
        
        if let sId = self.popUpDictionary?["sId"] as? String, self.popUpResultsArray.count > 0 {
            
            
            for obj in self.popUpResultsArray {
                if let selected = obj["selected"], selected == "1", let popUpInfo = obj["text"], let encoded = popUpInfo.URLEncodedString() {
                    
                    var currentQty = 0
                    if currentSelectedServiceDict[sId] != nil {
                        if let prevQty : CLong = CLong("\(currentSelectedServiceDict[sId]!)") {
                            currentQty = prevQty + 1
                        }else{
                            currentQty = 1

                            
                        }
                        
                    }else{
                        
                       currentQty = 1
                        
                    }
                    
                    self.callOrderIdUpdate(sId, qty: "\(currentQty)", orderID: self.currentOrderId, ncatid: responseData!.ncatid, popupinfo: encoded)
                    
                    
                 break
                }
                
                
                
            }
            
            
        
        
        
        }
        
        
        
        
        
    }
    
    
    
    
    
    func showContinueButton(_ show : Bool){
        
        
        if show {
            
            self.proceedWarningLabel.isHidden = true
            self.continueButton.setTitle("Continue", for: .normal)
            
            if let prevOrderObj = self.currentPrevOrder {
                
                if prevOrderObj.mainCnt > 0 {
                    
                    self.qtyLabel.text = "\(prevOrderObj.mainCnt)"
                    if prevOrderObj.totMainPrice == 0 {
                        self.priceLabel.text = "\(prevOrderObj.totPriceText)"

                    }else{
                        
                        var priceToDisplay = "\(prevOrderObj.totMainPrice)"
                        if floor(prevOrderObj.totMainPrice) == prevOrderObj.totMainPrice {
                            if let intpriceToDisplay = CLong(prevOrderObj.totMainPrice) as? CLong {
                                priceToDisplay = "\(intpriceToDisplay)"
                            }
                            
                        }
                        
                        
                        self.priceLabel.text = "₹\(priceToDisplay) \(prevOrderObj.totPriceText)"
                    }
                    
                    if prevOrderObj.cnt > 0 {
                            noteHeightConstraint?.constant = 50
                        
                        self.continueBottomConstraint.constant = 0
                    }else{
                        noteHeightConstraint?.constant = 64

                        self.continueBottomConstraint.constant = -90

                    }
                    
                    if prevOrderObj.proceed == 0 {
                        self.proceedWarningLabel.text = "\(prevOrderObj.btnText)"
                        self.proceedWarningLabel.isHidden = false
                        self.continueButton.backgroundColor = UIColor.colorFromRGB(168, g: 179, b: 190)
                        self.continueButton.setTitle("", for: .normal)
                        self.whiteRightArrow.isHidden = true
                    }else{
                        self.proceedWarningLabel.isHidden = true
                        self.continueButton.setTitle("\(prevOrderObj.btnText)", for: .normal)
                        self.continueButton.backgroundColor = UIColor.colorFromRGB(0, g: 118, b: 215)
                        self.whiteRightArrow.isHidden = false

                        
                        
                    }
                    
                    
                    
                }else{
                    
                    
                noteHeightConstraint?.constant = 64

                self.continueBottomConstraint.constant = -90

                
                }
                
                
            }else{
                noteHeightConstraint?.constant = 64

                self.continueBottomConstraint.constant = -90

            }
         
            
        }else{
            noteHeightConstraint?.constant = 64

            self.continueBottomConstraint.constant = -90

        
        
        }
        self.mainTableView.reloadData()

        delay(0.1) {
               UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                           
                            self.view.layoutIfNeeded()
                            
                        }, completion: nil)
                 
        }
     
        
    }
    
    
    
    
    @objc func minusAction(_ sender : UIButton) {
           
           
           if let section = sender.accessibilityValue, let row = sender.accessibilityIdentifier {
                     if let sectionInt = Int(section), let rowInt = Int(row) {
                     
                    let obj : MyJDSubStageDataResultElement = responseData!.data[sectionInt].result[rowInt]
                     var currentQty = 0
                         if currentSelectedServiceDict["\(obj.sId)"] != nil {
                             if var prevQty : CLong = CLong("\(currentSelectedServiceDict["\(obj.sId)"]!)"), prevQty > 0 {
                                 currentQty = prevQty - 1
                             }
                             
                         }
                        addButtonInProgressFlag = true

                         self.callOrderIdUpdate("\(obj.sId)", qty: "\(currentQty)", orderID: self.currentOrderId, ncatid: responseData!.ncatid, popupinfo: "")
                         
                         
                         
                         
                         
                         
                         
                     }
                     
                     
                 }
           
           
           
           
       }
    
    func updateQuantityCall(_ sId : String, qty : String){
        
        
        
        
        
        
        
    }
        
    //MARK: -  CollectionView Delegate Object
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           
        if section == 1 {
        if responseData != nil {

                return responseData!.data.count
                
            }else{
                return 0
            }
        }else{
            if responseData != nil && responseData!.dd.count > 0 {
                return 1
            }else{
                return 0

            }
        }
      }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
        if self.responseData != nil {
            self.currentSection = self.responseData!.data[indexPath.item]
            self.headerCollectionView.reloadData()
            self.picker.reloadAllComponents()
            scrollHeaderCollectionToSection(indexPath.item, animated: true, fixToZero: false)
            self.currentSelectedSection = indexPath.item
            delay(0.1) {
                
            
     //   DispatchQueue.main.async {
            let iP = IndexPath(item: 0, section: indexPath.item)
            self.scrollCheckDisabled = true
            
           self.mainTableView.scrollToRow(at: iP, at: .top, animated: true)
            delay(1){
                self.scrollCheckDisabled = false
            }
      //  }
        }
        }
        }else{
            
            self.showFilterView(true)
            
        }
    }
    
    func scrollHeaderCollectionToSection(_ section : Int, animated : Bool, fixToZero : Bool) {
        
        
        
        self.currentSection = self.responseData!.data[fixToZero ? 0 : section]
        if currentSelectedSection == section && !fixToZero {
            return
        }
//        UIView.performWithoutAnimation {
//            self.headerCollectionView.reloadData()
//        }
        self.headerCollectionView.reloadData()

        self.picker.reloadAllComponents()
       self.currentSelectedSection = section

        DispatchQueue.main.async {
            self.headerCollectionView.reloadData()

            let iP = IndexPath(item: section, section: 1)
//            if self.currentSelectedSection != section
//            {
//

                self.headerCollectionView.scrollToItem(at: iP, at: .centeredHorizontally, animated: animated)
            self.currentSelectedSection = section

      //      }

        }
        
        
        
    }
    
    
    
    
    
    
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.section == 1 {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyJDSubStageHeaderCollectionCell", for: indexPath) as! MyJDSubStageHeaderCollectionCell
        
        cell.KeyLabel.text = responseData!.data[indexPath.item].key
        cell.underlineBar.isHidden = true
        cell.KeyLabel.textColor = UIColor.gunmetal
        cell.KeyLabel.backgroundColor = UIColor.colorFromRGB(248, g: 248, b: 248)
        cell.KeyLabel.font = UIFont(name: "OpenSans", size: 13)
        cell.KeyLabel.layer.borderWidth = 1
        cell.KeyLabel.layer.borderColor = UIColor.colorFromRGB(229, g: 229, b: 229).cgColor
        if let currSec = self.currentSection {
            if currSec.key == responseData!.data[indexPath.item].key {
               // cell.underlineBar.isHidden = false
                cell.KeyLabel.layer.borderWidth = 0
                cell.KeyLabel.layer.borderColor = UIColor.colorFromRGB(0, g: 118, b: 215).cgColor

                cell.KeyLabel.textColor = UIColor.white
                cell.KeyLabel.font = UIFont(name: "OpenSans-Semibold", size: 13)
                cell.KeyLabel.backgroundColor = UIColor.colorFromRGB(0, g: 118, b: 215)


            }
        }
        return cell
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyJDSubStageHeaderCollectionCell", for: indexPath) as! MyJDSubStageHeaderCollectionCell
            cell.downImageView.isHidden = false
            cell.KeyLabel.text = ""
            cell.underlineBar.isHidden = true
            cell.KeyLabel.textColor = UIColor.gunmetal
            cell.KeyLabel.backgroundColor = UIColor.colorFromRGB(248, g: 248, b: 248)
            cell.KeyLabel.font = UIFont(name: "OpenSans", size: 13)
            cell.KeyLabel.layer.borderWidth = 1
            cell.KeyLabel.layer.borderColor = UIColor.colorFromRGB(229, g: 229, b: 229).cgColor
//            if let currSec = self.currentSection {
//                if currSec.key == responseData!.data[indexPath.item].key {
                   // cell.underlineBar.isHidden = false
                    cell.KeyLabel.layer.borderWidth = 0
                    cell.KeyLabel.layer.borderColor = UIColor.colorFromRGB(0, g: 118, b: 215).cgColor

                    cell.KeyLabel.textColor = UIColor.white
                    cell.KeyLabel.font = UIFont(name: "OpenSans-Semibold", size: 13)
                    cell.KeyLabel.backgroundColor = UIColor.colorFromRGB(0, g: 118, b: 215)
                              cell.filterLabel.layer.borderWidth = 0

            cell.filterLabel.textColor = UIColor.white
            cell.filterLabel.font = UIFont(name: "OpenSans-Semibold", size: 13)
            cell.filterLabel.backgroundColor = UIColor.clear
            cell.filterLabel.text = "  \(self.getSelectedFilter())"
            cell.filterLabel.isHidden = false

//                }
//            }
            
            return cell
            
        }
        
        
      }
    func getSelectedFilter() -> String {
        if let fullData = self.responseData {
            var filterCount = 0
            for obj in fullData.dd {
                if obj.checked == 1 {
                    if picker.numberOfComponents > 0 && picker.numberOfRows(inComponent: 0) > filterCount {
                        picker.selectRow(filterCount, inComponent: 0, animated: false)
                    }
                    return obj.lbl
                }
                filterCount = filterCount + 1
            }
        
        }
        return "Filter"
        
        
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    if indexPath.section == 1 {
        return CGSize(width: self.getHeaderWidth(responseData!.data[indexPath.item].key) + 20 , height: self.headerCollectionView.frame.size.height)
    }else{
       return CGSize(width: 90 , height: self.headerCollectionView.frame.size.height)
        
    }
       
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    
    deinit {
           
           NotificationCenter.default.removeObserver(self)
           
       }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
