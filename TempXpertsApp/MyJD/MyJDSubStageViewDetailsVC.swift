//


import UIKit
import SDWebImage

class MyJDSubStageViewDetailsVC : UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
  
    
    
    @IBOutlet weak var durationLeadingSpace: NSLayoutConstraint!
    
    
    @IBOutlet weak var jdSafetyView: UIView!
    
    @IBOutlet weak var jdSafetyLabel1: UILabel!
    
    
    @IBOutlet weak var jdSafetyLabel2: UILabel!
    
    @IBOutlet weak var jdSafetyHeight: NSLayoutConstraint!
    
    @IBOutlet weak var jdIconHomeButton: UIButton!
    
    
    @IBOutlet weak var hotsellerLabel: UILabel!
    
    @IBOutlet weak var hotsellerImage: UIImageView!
    
    
    @IBOutlet weak var loaderView: UIView!
    
    @IBOutlet weak var priceMainLabel: UILabel!
    
    @IBOutlet weak var priceStrikedLabel: UILabel!
    
    var currentServicesObject : MyJDCurrentSelectedServicesModel?
    var nCatTitle = ""
   @IBOutlet weak var continueView: UIView!
    @IBOutlet weak var continueButton: UIButton!

     @IBOutlet weak var proceedWarningLabel: UILabel!
    var upiData : Dictionary<String, AnyObject>!

      @IBOutlet weak var curveQtyView: UIView!
    var ncatid = ""
     @IBOutlet weak var qtyLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!

      @IBOutlet weak var whiteRightArrow: UIImageView!
     @IBOutlet weak var continueBottomConstraint: NSLayoutConstraint!
    
    
    var currentPrevOrder : MyJDSubStagePrevOrderModel?
    
    @IBOutlet weak var mrpPriceLabelHeight: NSLayoutConstraint!
       
       @IBOutlet weak var quantityLabel: UILabel!
       
       @IBOutlet weak var addButton: UIButton!
       
       
       @IBOutlet weak var buttonCurve: UIView!
       
       @IBOutlet weak var minusButton: UIButton!
       
       
       @IBOutlet weak var plusButton: UIButton!
       
       var serviceNameString = ""
       
       
       @IBOutlet var servicename : UILabel!
    
    
    /////////////
    
    
    @IBOutlet weak var topCollectionView: UICollectionView!
    
    
    @IBOutlet weak var headerJDButton: UIButton!
    
    @IBOutlet weak var mainHeaderView : UIView!
    
    @IBOutlet weak var headerImageView : UIImageView!

    @IBOutlet weak var headerTitle : UILabel!

    @IBOutlet weak var headerHotseller : UIButton!
    var typeAHeight : CGFloat = 0
    var typeBHeight : CGFloat = 0
    
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var mainTableView : UITableView!

    
    var sid : String = ""
    var orderId : String = ""
    
    var typeA : Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
    var typeB : Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
    var typeC : Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
    var typeFAQ : Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()

    
    var typeAThumbnails : Array<Dictionary<String, AnyObject>> = []

    var typeCThumbnails : Array<Dictionary<String, AnyObject>> = []
    var typeFAQThumbnails : Array<Dictionary<String, AnyObject>> = []

    
    @IBOutlet weak var sdurationLabel: UILabel!
    
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.setNavigationBarHidden(true, animated: false)
         self.navigationController?.navigationBar.isHidden = true
     }
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.topCollectionView.register(UINib(nibName: "MyJDSubStageViewDetailsPhotoCell", bundle: nil), forCellWithReuseIdentifier: "MyJDSubStageViewDetailsPhotoCell")
        sdurationLabel.font =  UIFont.init(name: "OpenSans", size: 13)
        
        self.sdurationLabel.text = ""
        // \u{2022}  60 min
        self.priceMainLabel.font =  UIFont.init(name: "OpenSans-Bold", size: 20)
        self.priceStrikedLabel.font =  UIFont.init(name: "OpenSans", size: 14)
        jdSafetyView.isUserInteractionEnabled = true
          let tapgesture = UITapGestureRecognizer(target: self, action: #selector(self.jdSafetyTap(sender:)))
            tapgesture.numberOfTapsRequired = 1
          jdSafetyView.addGestureRecognizer(tapgesture)
        self.headerTitle.font =  UIFont.init(name: "OpenSans-Semibold", size: 20)

        
        jdSafetyLabel1.font =  UIFont.init(name: "OpenSans-Bold", size: 15)
        jdSafetyLabel2.font =  UIFont.init(name: "OpenSans", size: 12)
        jdSafetyView.createDottedLine(width: 1, color: UIColor.colorFromRGB(228, g: 234, b: 239).cgColor, startPoint: CGPoint(x: 20, y: 20), endPoint: CGPoint(x: self.view.frame.size.width - 20, y: 20))
        self.hotsellerLabel.layer.cornerRadius = 2
        self.hotsellerLabel.layer.masksToBounds = true
        self.hotsellerLabel.isHidden = true
        self.hotsellerImage.isHidden = true
        let footerV = UIView.init(frame : CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 60))
           footerV.backgroundColor = UIColor.white
           mainTableView.tableFooterView = footerV
        continueButton.layer.cornerRadius = continueButton.frame.size.height/2
        continueButton.layer.masksToBounds = true
        curveQtyView.layer.cornerRadius = 4
        curveQtyView.layer.borderWidth = 1.5
        curveQtyView.layer.borderColor = UIColor.white.cgColor
        curveQtyView.layer.masksToBounds = true
        addButton.addTarget(self, action: #selector(self.plusAction(sender:)), for: UIControl.Event.touchUpInside)
        plusButton.addTarget(self, action: #selector(self.plusAction(sender:)), for: UIControl.Event.touchUpInside)
        minusButton.addTarget(self, action: #selector(self.minusAction(sender:)), for: UIControl.Event.touchUpInside)
        
         continueButton.addTarget(self, action: #selector(self.continueAction(_sender:)), for: UIControl.Event.touchUpInside)
          upiData = Dictionary<String, AnyObject>()
        buttonCurve.layer.cornerRadius = 5
           buttonCurve.layer.masksToBounds = true
        buttonCurve.layer.borderWidth = 1
        buttonCurve.layer.borderColor = UIColor.colorFromRGB(0, g: 118, b: 215).cgColor
        addButton.titleLabel?.font = UIFont.init(name: "OpenSans-Semibold", size: 13)
         NotificationCenter.default.addObserver(self, selector: #selector(self.updatePrevOrderByNotification(_:)), name: NSNotification.Name(rawValue: "myJDOrderModified"), object: nil)
        
        
        topCollectionView.delegate = self
        topCollectionView.dataSource = self

        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.estimatedRowHeight = 100
        mainTableView.rowHeight = UITableView.automaticDimension
        
        headerJDButton.imageView?.contentMode = .scaleAspectFit
        
        
        

         self.edgesForExtendedLayout = .bottom
                     self.extendedLayoutIncludesOpaqueBars = true
        fetchData()
    }
    
    
    
    @objc func jdSafetyTap (sender : UITapGestureRecognizer) {
        
//        print("Tapped")
//        let vc = UIStoryboard(name: "categoryLanding", bundle: nil).instantiateViewController(withIdentifier: "SafetyMeasuresViewController") as? SafetyMeasuresViewController
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func setupPage(){
        
        if typeA.count > 0 && ((typeA["data"] as? Dictionary<String, AnyObject>)?["thumbnails"] as? Array<Dictionary<String, AnyObject>>)!.count > 0 {
            typeAHeight = 166
            if let aspectRatio = (((typeA["data"] as? Dictionary<String, AnyObject>)?["thumbnails"] as? Array<Dictionary<String, AnyObject>>)?[0] as? Dictionary<String, AnyObject>)?["aspratio"] as? String {
                
                let components = aspectRatio.components(separatedBy: ":")
                if components.count == 2 {
                    if let w = Float(components[0]), let h = Float(components[1]) {
                      
                        let heightOfImageView : CGFloat = CGFloat((UIScreen.main.bounds.size.width) * CGFloat(h/w))
                        
                        self.typeAHeight = heightOfImageView + 40
                        self.collectionViewHeightConstraint.constant = self.typeAHeight
                        self.view.layoutIfNeeded()

                    }
                    
                    
                    
                }
                
                
                
                
                
            }
            
            
            
            
            setupTypeA()
            
        }else{
            typeAHeight = 0

            self.collectionViewHeightConstraint.constant = 0
            
        }
        
        if typeB.count > 0 {
            setupTypeB()
            typeBHeight = self.headerTitle.intrinsicContentSize.height + 30 + self.jdSafetyHeight.constant
            
            

        }else{
            
        }
        if let headerView = mainTableView.tableHeaderView {
            
            headerView.frame.size.height = typeAHeight + typeBHeight
            mainTableView.tableHeaderView = headerView
            
        }
        self.view.layoutIfNeeded()
        
        mainTableView.reloadData()
        if self.currentPrevOrder != nil {
        self.updatePrevOrder(self.currentPrevOrder!)
        }
        
        
        
        
        
        
        
    }
    
    func setupTypeA(){
        
        typeAThumbnails = (typeA["data"] as! Dictionary<String, AnyObject>)["thumbnails"] as! Array<Dictionary<String, AnyObject>>
        
        
        
        
        
        topCollectionView.reloadData()
        
        
        
        
    }
    
    func setupTypeB(){
        
        if let ctitle = (typeB["data"] as? Dictionary<String, AnyObject>)?["ctitle"] as? String {
            self.headerTitle.text = ctitle
          
        }
        
        
        
        
        if let typeCThumbnails = (typeB["data"] as? Dictionary<String, AnyObject>)?["thumbnails"] as? Dictionary<String, AnyObject> {
            
            self.hotsellerLabel.isHidden = true
            self.hotsellerImage.isHidden = true
            if let hotseller = typeCThumbnails["hotsellerText"] as? String, hotseller.length > 0  {

                self.hotsellerLabel.isHidden = false
                self.hotsellerImage.isHidden = false
                self.hotsellerLabel.text = "  \(hotseller)  "
                self.hotsellerLabel.font =  UIFont.init(name: "OpenSans", size: 9)

            }
            
            
            
            
            let offerPrice = typeCThumbnails["sOfferPrice"] as? Float ?? 0
            var offerPriceStr =  "\(offerPrice)"
            
            
            if floor(offerPrice) == offerPrice {
                if let intOfferPrice = CLong(offerPrice) as? CLong {
                    offerPriceStr = "\(intOfferPrice)"
                }
                
            }
            let mrpPrice = typeCThumbnails["sMrpPrice"] as? Float ?? 0
            var mrpPriceStr =  "\(mrpPrice)"

            if floor(mrpPrice) == mrpPrice {
                if let intMrpPrice = CLong(mrpPrice) as? CLong {
                    mrpPriceStr = "\(intMrpPrice)"
                }
                
            }
            
            
            if offerPrice == 0 {
                
                setupPriceLabels(mrpPriceStr, strikedPrice: "")
                
            }else{
                
                setupPriceLabels(offerPriceStr, strikedPrice: mrpPriceStr)

                
            }
            
            let sDuration = typeCThumbnails["sDuration"] as? String ?? ""
            if sDuration.length > 0 {
                sdurationLabel.text = " \u{2022}  \(sDuration)"
            }
            
            
        }
    }
    
    func setupPriceLabels(_ mainPrice : String, strikedPrice : String) {
        
    
        priceMainLabel.text = "₹\(mainPrice)"
                   
        
        if strikedPrice.length == 0 {
            
            priceStrikedLabel.isHidden = true
            durationLeadingSpace.constant = -30
            
        }else{
            
            durationLeadingSpace.constant = 5

            priceStrikedLabel.isHidden = false

                   let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "₹\(strikedPrice)")
                         attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
                   priceStrikedLabel.attributedText = attributeString
            
        }
        self.view.layoutIfNeeded()
        
        
    }
    
    func setupTypeC(){
              
        mainTableView.reloadData()
              
              
       }
    //MARK: TableViewDelegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return typeCThumbnails.count + (typeFAQThumbnails.count > 0 ? 1 : 0)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section < typeCThumbnails.count {
        if let rowDataArray = (typeCThumbnails[section] as? Dictionary<String, AnyObject>)?["data"] as? Array<String> {
            return rowDataArray.count
        }
        }else{
            if typeFAQThumbnails.count > 0 {
                if let dataFAQ = typeFAQThumbnails[0]["data_faq"] as? Array<Dictionary<String, String>>, dataFAQ.count > 0 {
                    return dataFAQ.count
                }
                
            }
            
            
            
        }
        
        return 0
        
        
        
    }
    
    
    //MyJDSubStageViewDetailsDescCellFAQ
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section < typeCThumbnails.count {

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyJDSubStageViewDetailsDescCell", for: indexPath) as! MyJDSubStageViewDetailsDescCell
        
        
        cell.descLabel.text = ""
        
            
            if let descStr = ((typeCThumbnails[indexPath.section] as? Dictionary<String, AnyObject>)?["data"] as? Array<String>)?[indexPath.row] as? String {
                
                cell.descLabel.text = "\(descStr)"
                
            }
            return cell

        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyJDSubStageViewDetailsDescCellFAQ", for: indexPath) as! MyJDSubStageViewDetailsDescCellFAQ
                   
            if let QStr = ((typeFAQThumbnails[0] as? Dictionary<String, AnyObject>)?["data_faq"] as? Array<Dictionary<String, String>>)?[indexPath.row]["Q"] as? String {
                
                cell.QLabel.text = "\(QStr)"
                
            }

            if let AStr = ((typeFAQThumbnails[0] as? Dictionary<String, AnyObject>)?["data_faq"] as? Array<Dictionary<String, String>>)?[indexPath.row]["A"] as? String {
                           
                           cell.ALabel.text = "- \(AStr)"
                           
                       }
            
            
                   
                //   cell.descLabel.text = ""
                   
                       
//                       if let descStr = ((typeCThumbnails[indexPath.section] as? Dictionary<String, AnyObject>)?["data"] as? Array<String>)?[indexPath.row] as? String {
//
//                           cell.descLabel.text = "\(descStr)"
//
//                       }
                       return cell
            
            
            
            
            
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
  
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        
        let secHeaderView = UIView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
        
       
        
        let sectionLabel = UILabel.init(frame: CGRect(x: 20, y: 20, width: self.view.frame.size.width - 40, height: 20))
        
        
        sectionLabel.numberOfLines = 1
        sectionLabel.font = UIFont.init(name: "OpenSans-Semibold", size: 15)
        sectionLabel.textColor =  UIColor.gunmetal
        
        if section < typeCThumbnails.count {
        sectionLabel.text = (typeCThumbnails[section] as! Dictionary<String, AnyObject>)["title"] as? String
        }else{
            if typeFAQThumbnails.count > 0 {
                
                
                sectionLabel.text = (typeFAQThumbnails[0] as! Dictionary<String, AnyObject>)["title"] as? String

                
                
            }else{
                sectionLabel.text = ""
            }
            
        }
        secHeaderView.addSubview(sectionLabel)
        
        if section != 0 {
         let topLine = UIView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 1))
            topLine.backgroundColor = UIColor.colorFromRGB(240, g: 243, b: 245)
            
            secHeaderView.addSubview(topLine)
        
        }
        
        
        
        
        
        return secHeaderView
        
        
        
        
    }
    
    
    
    
    
    //MARK: CollectionViewDelegates

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return typeAThumbnails.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyJDSubStageViewDetailsPhotoCell", for: indexPath) as! MyJDSubStageViewDetailsPhotoCell
        cell.imageV.image = nil
        
            
        if self.typeAThumbnails.count > indexPath.item, let imgStr = (self.typeAThumbnails[indexPath.item] as? Dictionary<String, AnyObject>)?["img"] as? String, let url = NSURL.init(string: imgStr) as? URL {
                 cell.imageV.sd_setImage(with: url, placeholderImage: UIImage(named: "no_image"))
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: topCollectionView.frame.size.height)
      }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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
                       
                           self.continueBottomConstraint.constant = 0
                       }else{
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
                       
                       
                   
                   self.continueBottomConstraint.constant = -90

                   
                   }
                   
                   
               }else{
                   
                   self.continueBottomConstraint.constant = -90

               }
            
               
           }else{
               
               self.continueBottomConstraint.constant = -90

           
           
           }
           self.mainTableView.reloadData()

           delay(0.1) {
                  UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                              
                               self.view.layoutIfNeeded()
                               
                           }, completion: nil)
                    
           }
        
           
       }
    
    
    
    
    @IBAction func jdHomeButtonAction(_ sender: Any) {
   
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    func fetchData(){
        
        let urlString = "https://jdxperts.justdial.com/user/view_details?sId=\(sid)&oid=\(orderId)&city=\(GlobalData.city!.replacingOccurrences(of: " ", with: "%20"))&data_city=\(GlobalData.dataCity!.replacingOccurrences(of: " ", with: "%20"))" + GlobalData.defaultURL!
        
        HttpUtils.getJSONRequest(urlString, targetViewController: self) { (responseObject, error) -> Void in
            if (responseObject != nil) {
                
                self.loaderView.isHidden = true
                if let results = responseObject?.object(forKey: "results") as? Array<Dictionary<String, AnyObject >> {
                    
                    if let prevOrderDict = responseObject?["prevOrder"] as? Dictionary<String, AnyObject> {
                        
                        
                        self.currentPrevOrder = Mapper<MyJDSubStagePrevOrderModel>().map(JSONObject: prevOrderDict)
                        if let cPrevOrder = self.currentPrevOrder {
                            self.orderId = cPrevOrder.oid
                        }
                         self.showContinueButton(true)
                        
                        
                    }else{
                        
                        let dict : Dictionary<String, AnyObject> = [:]
                        self.currentPrevOrder = Mapper<MyJDSubStagePrevOrderModel>().map(JSONObject: dict)
                        
                        
                    }
                    
                    
                    
                    
                    for obj in results {
                        if let ctid = obj["ctid"] as? String {
                            
                            switch ctid {
                            case "38":
                                
                                self.typeA = obj
                                 
                                
                            case "50":
                                self.typeB = obj
                                
                            case "45":
                                
                                self.typeC = obj
                                if let thumbnails = (obj["data"] as? Dictionary<String, AnyObject>)?["thumbnails"] as? Array<Dictionary<String, AnyObject>>, thumbnails.count > 0 {
                                    self.typeCThumbnails = thumbnails
                                    
                                }
                            case "59":
                                self.typeFAQ = obj
                                if let thumbnails = (obj["data"] as? Dictionary<String, AnyObject>)?["thumbnails"] as? Array<Dictionary<String, AnyObject>>, thumbnails.count > 0 {
                                    self.typeFAQThumbnails = thumbnails
                                    
                                }
                            default:
                              break
                            }
                           
                            
                        }
                        
                        
                        
                        
                        
                    }
                    
                    
                    self.setupPage()
                    
                    
                    
                    
                    
                }
                
                
            }
            
            
        }
        
        
    }
    @IBAction func continueAction(_sender : UIButton) {
            
            if let currentContinueObject = self.currentPrevOrder {
                
              if currentContinueObject.proceed == 0 {
                  return
              }
              
                switch currentContinueObject.nextPage {
                    case "covid_pg":
//                    let covidVC = UIStoryboard(name: "ODSSummary", bundle: nil).instantiateViewController(withIdentifier: "ODSCovidDisclaimerPage") as! ODSCovidDisclaimerPage
//
//                    covidVC.oid = currentContinueObject.oid
//                    covidVC.ncatid = currentContinueObject.ncatid
//                    covidVC.catTitle = self.nCatTitle
//                    self.navigationController?.pushViewController(covidVC, animated: true)
                    break
                case "add_on_pg":
                    let notificationVc = UIStoryboard(name: "MyJDSubStageStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "MyJDSubStageAddOnController") as! MyJDSubStageAddOnController
                    
                    notificationVc.orderId = currentContinueObject.oid
                    notificationVc.ncatid = currentContinueObject.ncatid
                    
                    notificationVc.currentServicesObject = self.currentServicesObject
                    notificationVc.currentPrevOrder = self.currentPrevOrder
                  //  notificationVc.parentSubStageVC = self
                    notificationVc.catTitle = self.nCatTitle
                    self.navigationController!.pushViewController(notificationVc, animated: true)
                    break
                case "summary_pg":
                  if currentContinueObject.proceed == 0 {
                      return
                  }
//                    let summaryPage = UIStoryboard(name: "ODSSummary", bundle: nil).instantiateViewController(withIdentifier: "ODSSummaryViewControllerBeforePG") as! ODSSummaryViewControllerBeforePG
//                    summaryPage.orderID = currentContinueObject.oid
//                    summaryPage.ncatid = currentContinueObject.ncatid
//                    if let orderDetails = self.currentPrevOrder?.orderDetails {
//                        for obj in orderDetails {
//                            summaryPage.catTitle = obj.rootCatName
//                            break
//                        }
//                    }
//                    self.navigationController?.pushViewController(summaryPage, animated: true)
                    break
                default:
                    break
                }
                
                

                
            }
           
        
        }
    
    @objc func plusAction(sender : UIButton) {
        var qty = 0
        
        if let orderDetails = self.currentPrevOrder?.orderDetails {
                 
                 for obj in orderDetails {
                     if obj.sId == self.sid {
                        
                        qty = obj.qty
                         
                        break
                     }
                     
                 }
                 
             }
        
        qty = qty + 1
        
        callOrderIdUpdate(self.sid, qty: "\(qty)", orderID: self.orderId, ncatid: self.ncatid, popupinfo: "")
        
        
    }
    
    
    @objc func minusAction(sender : UIButton) {
          
                var qty = 0
                 
                 if let orderDetails = self.currentPrevOrder?.orderDetails {
                          
                          for obj in orderDetails {
                              if obj.sId == self.sid {
                                 
                                 qty = obj.qty
                                  
                                 break
                              }
                              
                          }
                          
                      }
        if qty > 0 {
                 qty = qty - 1
                 
                 callOrderIdUpdate(self.sid, qty: "\(qty)", orderID: self.orderId, ncatid: self.ncatid, popupinfo: "")
          
        }
          
      }
    
    
    
    
    func callOrderIdUpdate(_ sid : String, qty : String, orderID : String, ncatid : String, popupinfo : String){
           var sDetail = ["sId" : sid, "qty" : qty]
               var subfilterLocal = "[{\"sId\":\"\(sid)\",\"qty\":\(qty)}]".URLEncodedString()!
           subfilterLocal = subfilterLocal.replacingOccurrences(of: ":", with: "%3A")
             
        cancelAndFireNewToast("Xperts - API C - 1")

           let orderIdUpdateApi = "https://jdxperts.justdial.com/user/add_cart?sDetail=\(subfilterLocal)&ncatid=\(ncatid)&oid=\(orderID)&popupinfo=\(popupinfo)&wap=3&city=\(GlobalData.city!.replacingOccurrences(of: " ", with: "%20"))&data_city=\(GlobalData.dataCity!.replacingOccurrences(of: " ", with: "%20"))" + GlobalData.defaultURL! + "&deviceid=\(upiData["device_id"] as? String ?? "")"
           
           HttpUtils.getJSONRequest(orderIdUpdateApi, targetViewController: self) { (responseObject, error) -> Void in
            cancelAndFireNewToast("Xperts - API C - 2")

               if (responseObject != nil) {
                   
                cancelAndFireNewToast("Xperts - API C - 3")

                   if let err_code = responseObject!["err_code"] as? Int, err_code != 0 {
                    cancelAndFireNewToast("Xperts - API C - 4")

                       if let errMsg = responseObject!["msg"] as? String {
                           UIApplication.shared.keyWindow!.hideAllToasts()

                              UIApplication.shared.keyWindow!.makeToast(errMsg)
                           
                       }
                       
                       return
                       
                       
                   }
                cancelAndFireNewToast("Xperts - API C - 5")

                   print("\n result - \(responseObject)")
                   
                   if responseObject!["popUp"] != nil && "\(responseObject!["popUp"]!)" == "1"  {
                       
//                       self.popUpDictionary = responseObject as! Dictionary<String, AnyObject>
//
//                       self.showPopUp(true)
                    cancelAndFireNewToast("Xperts - API C - 6")

                       return
                   }else{
                    cancelAndFireNewToast("Xperts - API C - 7")

                    self.currentServicesObject = Mapper<MyJDCurrentSelectedServicesModel>().map(JSONObject: responseObject)
                   

                   if let currentServiceObject = self.currentServicesObject {
                       let results = currentServiceObject.results
                       if results.count > 0 {
                           self.orderId = results[0].oid
                           
                       }
                       if let prevOrder = currentServiceObject.prevOrder {

                           self.updatePrevOrder(prevOrder)

                       }
                       
                   }
                    cancelAndFireNewToast("Xperts - API C - 8")

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
                    cancelAndFireNewToast("Xperts - API C - 9")

                   objectTosend.updateValue(currServices, forKey: "currServices")
                       objectTosend.updateValue(self, forKey: "originVC")
                   NotificationCenter.default.post(name: Notification.Name("myJDOrderModified"), object: objectTosend)
                   
                   
                   }
                   
                   
               }
               
               
               
           }
           
           
           
           
           
           
       }
    
    
    @objc func updatePrevOrderByNotification(_ notification : NSNotification) {
         
     // print("check")
         
         if let originVC = (notification.object as? Dictionary<String, AnyObject>)?["originVC"] as? UIViewController {
             if originVC == self {
                 return
             }
             
         }
         if let prevOrder = (notification.object as? Dictionary<String, AnyObject>)?["prevOrder"] as? MyJDSubStagePrevOrderModel {

             if self.ncatid == prevOrder.ncatid {
         
         
             self.orderId = prevOrder.oid
             self.updatePrevOrder(prevOrder)
         }
         
         }
     }
    
    
    func updatePrevOrder(_ obj : MyJDSubStagePrevOrderModel){
        
        self.currentPrevOrder = obj
        
        if let orderDetails = self.currentPrevOrder?.orderDetails {
            self.addButton.isHidden = false
            self.plusButton.isHidden = true
            self.minusButton.isHidden = true
            self.quantityLabel.text = ""
            
            for obj in orderDetails {
                if obj.sId == self.sid {
                    
                   self.addButton.isHidden = true
                   self.plusButton.isHidden = false
                    self.minusButton.isHidden = false
                    self.quantityLabel.text = "\(obj.qty)"
                    
                   break
                }
                
            }
            
        }
        
        
        
        /*
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
         
         
         */
        
        
        
        
        
        
        
        
        
        
        self.showContinueButton(true)
        
    }
    
    deinit {
           
           NotificationCenter.default.removeObserver(self)
           
       }
}
extension UIView {
    func createDottedLine(width: CGFloat, color: CGColor, startPoint : CGPoint, endPoint : CGPoint) {
      let caShapeLayer = CAShapeLayer()
      caShapeLayer.strokeColor = color
      caShapeLayer.lineWidth = width
      caShapeLayer.lineDashPattern = [4,3]
      let cgPath = CGMutablePath()
      let cgPoint = [startPoint, endPoint]
      cgPath.addLines(between: cgPoint)
      caShapeLayer.path = cgPath
      layer.addSublayer(caShapeLayer)
   }
}
