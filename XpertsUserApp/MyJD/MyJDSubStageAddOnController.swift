//
//  MyJDSubStageAddOnController.swift
//  Riot
//
//  Created by Swagat on 6/19/20.
//  Copyright © 2020 Justdial Ltd. All rights reserved.
//

import UIKit
import SDWebImage

class MyJDSubStageAddOnController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var proceedWarningLabel: UILabel!
    
    var proceedEnabled = true
    
     var currentPrevOrder : MyJDSubStagePrevOrderModel?
    
    var parentSubStageVC : MyJDSubStageController?
    
    @IBOutlet weak var nextButton: UIButton!
       
       @IBOutlet weak var curveQtyView: UIView!
       
       @IBOutlet weak var qtyLabel: UILabel!
     
       
       @IBOutlet weak var priceLabel: UILabel!
     
     
       @IBOutlet weak var continueBottomConstraint: NSLayoutConstraint!
    
    
    
    
    
      var currentSelectedServiceDict : Dictionary<String, AnyObject> = [:]
    
    
    var currentServicesObject : MyJDCurrentSelectedServicesModel?

    
    @IBOutlet weak var mainHeaderView: UIView!
    
    @IBOutlet weak var topHeaderView: UIView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var skipButton: UIButton!
    
    
    @IBOutlet weak var topTitleLabel: UILabel!
    
    
    
    
    
    
    @IBOutlet weak var mainTableView: UITableView!
    var orderId : String = ""
    var ncatid : String = ""
    var addOnResponseData : MyJDAddOnModel!
    var urlString : String = ""
    var catTitle = ""
    var upiData : Dictionary<String, AnyObject>!

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.navigationBar.isHidden = true
        //hideTabBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .bottom
              self.extendedLayoutIncludesOpaqueBars = true
          NotificationCenter.default.addObserver(self, selector: #selector(self.updatePrevOrderByNotification(_:)), name: NSNotification.Name(rawValue: "myJDOrderModified"), object: nil)
        upiData = Dictionary<String, AnyObject>()
       
        
        if catTitle.length > 0 {
            self.topTitleLabel.text = self.catTitle
        }
        skipButton.isHidden = true
        self.addOnResponseData = Mapper<MyJDAddOnModel>().map(JSONObject: ["oid" : orderId])
        
        nextButton.layer.cornerRadius = nextButton.frame.size.height/2
              nextButton.layer.masksToBounds = true
              
              
              curveQtyView.layer.cornerRadius = 4
              curveQtyView.layer.borderWidth = 1.5
              curveQtyView.layer.borderColor = UIColor.white.cgColor
              curveQtyView.layer.masksToBounds = true
        
        
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.fetchAddOns()
    }
    

    func fetchAddOns(){
        
        urlString = "https://jdxperts.justdial.com/user/add_on_pg?ncatid=\(self.ncatid)&oid=\(self.orderId)&city=\(GlobalData.city!.replacingOccurrences(of: " ", with: "%20"))&data_city=\(GlobalData.dataCity!.replacingOccurrences(of: " ", with: "%20"))" + GlobalData.defaultURL! + "&deviceid=\(upiData["device_id"] as? String ?? "")"
        
        HttpUtils.getJSONRequest(self.urlString, targetViewController: self) { (responseObject, error) -> Void in
            if (responseObject != nil) {
                
                print(responseObject)
                self.addOnResponseData = Mapper<MyJDAddOnModel>().map(JSONObject: responseObject)
                if self.addOnResponseData != nil {
                for subLocalObj in self.addOnResponseData.results {
                    if subLocalObj.qty > 0 {
                        self.currentSelectedServiceDict["\(subLocalObj.sId)"] = subLocalObj.qty as AnyObject
                        
                    }
                    
                }
                }
                if self.addOnResponseData.prevOrder != nil {
                    
                    self.currentPrevOrder = self.addOnResponseData!.prevOrder
                }
                self.setupTableView()
                
                
                
            }
            
            
            
        }
        
        
        
    }
    @IBAction func backAction(_ sender: Any) {
          
          self.navigationController?.popViewController(animated: true)
          
      }
    func setupTableView(){
        
        self.mainTableView.reloadData()
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.addOnResponseData.results.count
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

              let headerView = UITableViewHeaderFooterView.init(reuseIdentifier: "collectionHeader")
              
              headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60)
             // headerView.reuseIdentifier = "collectionHeader"
              let label = UILabel.init(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.width, height: 60))
              label.font = UIFont(name: "OpenSans-Bold", size: 20)
              headerView.addSubview(label)
              label.tag = 100
              label.text = "Add-Ons"
              return headerView
              
          
      }
      
      func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          return 60
      }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyJDSubStageAddOnCell", for: indexPath) as! MyJDSubStageAddOnCell
        
        
        let obj = addOnResponseData.results[indexPath.row]
        
        
        
        cell.serviceName.text = obj.sName
        
        if obj.sOfferPrice > 0 {
            
            
            
            cell.mrpPriceLabel.text = "₹ \(obj.sOfferPrice)"
            
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "₹ \(obj.sMrpPrice)")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cell.discountedPriceLabel.attributedText = attributeString
            
            
        }else{
            
            cell.mrpPriceLabel.text = "₹ \(obj.sMrpPrice)"
            cell.discountedPriceLabel.attributedText = nil
        }
        
        
        
        
        
        
        
        
        
        
        
     // Action Setup
        
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
        
        if cell.addButton.accessibilityLabel == nil {
            cell.addButton.accessibilityLabel = "setUp"
            cell.addButton.addTarget(self, action: #selector(self.plusAction(_:)), for: UIControl.Event.touchUpInside)
             cell.plusButton.addTarget(self, action: #selector(self.plusAction(_:)), for: UIControl.Event.touchUpInside)
             cell.minusButton.addTarget(self, action: #selector(self.minusAction(_:)), for: UIControl.Event.touchUpInside)
        }
        cell.addButton.accessibilityValue = "\(indexPath.section)"
        cell.addButton.accessibilityIdentifier = "\(indexPath.row)"
        
        cell.plusButton.accessibilityValue = "\(indexPath.section)"
              cell.plusButton.accessibilityIdentifier = "\(indexPath.row)"
        
        cell.minusButton.accessibilityValue = "\(indexPath.section)"
              cell.minusButton.accessibilityIdentifier = "\(indexPath.row)"
        
        
        
        return cell
        
    }
    
    
    
    @IBAction func nextAction(_ sender: Any) {

        
       // clickTracker("filter_next", ll: "ods_filterpage_\(self.ncatid)", vid: "")

        
        if let currentContinueObject = self.currentPrevOrder {

          if currentContinueObject.proceed == 0 {
              return
          }

            switch currentContinueObject.nextPageAddon {
            case "covid_pg":
//              let covidVC = UIStoryboard(name: "ODSSummary", bundle: nil).instantiateViewController(withIdentifier: "ODSCovidDisclaimerPage") as! ODSCovidDisclaimerPage
//
//              covidVC.oid = currentContinueObject.oid
//              covidVC.ncatid = currentContinueObject.ncatid
//              covidVC.catTitle = self.catTitle
//              self.navigationController?.pushViewController(covidVC, animated: true)
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
//                self.navigationController?.pushViewController(summaryPage, animated: true)
                break
            default:
                break
            }
        }
    
    }
    
    @objc func updatePrevOrderByNotification(_ notification : NSNotification) {
          
      // print("check")
          if let prevOrder = (notification.object as? Dictionary<String, AnyObject>)?["prevOrder"] as? MyJDSubStagePrevOrderModel {

              if self.ncatid == prevOrder.ncatid {
          
          if let currServModels = (notification.object as? Dictionary<String, AnyObject>)?["currServices"] as? [MyJDCurrServicesModel] {
          var currentSelectedServiceDictLocal : Dictionary<String, AnyObject> = [:]

            for currServicesObj in currServModels {
                
                
                currentSelectedServiceDictLocal[currServicesObj.service_id] = currServicesObj.qty as AnyObject
                
                
            }
            
            //  self.mergecurrServicestosDesc(currServModels)
              
            self.currentSelectedServiceDict = currentSelectedServiceDictLocal
              self.mainTableView.reloadData()
          }
          
          
              self.orderId = prevOrder.oid
              self.updatePrevOrder(prevOrder)
          }
          
          }
      }
    
    
    @IBAction func skipAction(_ sender: Any) {
   
     print("check")
//        if self.currentPrevOrder != nil {
//        let summaryPage = UIStoryboard(name: "ODSSummary", bundle: nil).instantiateViewController(withIdentifier: "ODSSummaryViewControllerBeforePG") as! ODSSummaryViewControllerBeforePG
//            summaryPage.orderID = self.currentPrevOrder!.oid
//            summaryPage.ncatid = self.currentPrevOrder!.ncatid
//            if let orderDetails = self.currentPrevOrder?.orderDetails {
//                for obj in orderDetails {
//                    summaryPage.catTitle = obj.rootCatName
//                    break
//                }
//            }
//        self.navigationController?.pushViewController(summaryPage, animated: true)
//        }
    }
    
    
    
    
    
    @objc func minusAction(_ sender : UIButton) {
              
              
              if let section = sender.accessibilityValue, let row = sender.accessibilityIdentifier {
                        if let sectionInt = Int(section), let rowInt = Int(row) {
                        
                       let obj : MyJDAddOnResultModel = addOnResponseData.results[rowInt]
                        var currentQty = 0
                            if currentSelectedServiceDict["\(obj.sId)"] != nil {
                                if var prevQty : CLong = CLong("\(currentSelectedServiceDict["\(obj.sId)"]!)"), prevQty > 0 {
                                    currentQty = prevQty - 1
                                }
                                
                            }
                            
                            self.callOrderIdUpdate("\(obj.sId)", qty: "\(currentQty)", orderID: self.orderId, ncatid: self.ncatid)
                            
                            
                            
                            
                            
                            
                            
                        }
                        
                        
                    }
              
              
              
              
          }
    
    @objc func plusAction(_ sender : UIButton) {
          
          if let section = sender.accessibilityValue, let row = sender.accessibilityIdentifier {
              if let sectionInt = Int(section), let rowInt = Int(row) {
              
             let obj : MyJDAddOnResultModel = addOnResponseData.results[rowInt]
              var currentQty = 1

                  if currentSelectedServiceDict["\(obj.sId)"] != nil {
                      if var prevQty : CLong = CLong("\(currentSelectedServiceDict["\(obj.sId)"]!)") {
                          currentQty = prevQty + 1
                      }
                      
                  }
                  
                  self.callOrderIdUpdate("\(obj.sId)", qty: "\(currentQty)", orderID: self.orderId, ncatid: self.ncatid)
                  
                  
                  
                  
                  
                  
                  
              }
              
              
          }
          
          
      }
    
    func callOrderIdUpdate(_ sid : String, qty : String, orderID : String, ncatid : String){
          var sDetail = ["sId" : sid, "qty" : qty]
              var subfilterLocal = "[{\"sId\":\"\(sid)\",\"qty\":\(qty)}]".URLEncodedString()!
          subfilterLocal = subfilterLocal.replacingOccurrences(of: ":", with: "%3A")
          
          
        let orderIdUpdateApi = "https://jdxperts.justdial.com/user/add_cart?sDetail=\(subfilterLocal)&ncatid=\(ncatid)&oid=\(orderID)&popupinfo=&wap=3&city=\(GlobalData.city!.replacingOccurrences(of: " ", with: "%20"))&data_city=\(GlobalData.dataCity!.replacingOccurrences(of: " ", with: "%20"))" + GlobalData.defaultURL! + "&deviceid=\(upiData["device_id"] as? String ?? "")" + "&page=add_on_pg"
          
          HttpUtils.getJSONRequest(orderIdUpdateApi, targetViewController: self) { (responseObject, error) -> Void in
              if (responseObject != nil) {
                  
                  
                  print("\n result - \(responseObject)")
                   self.currentServicesObject = Mapper<MyJDCurrentSelectedServicesModel>().map(JSONObject: responseObject)
                 
                  var currentSelectedServiceDictLocal : Dictionary<String, AnyObject> = [:]

                  for currServicesObj in self.currentServicesObject!.currServices {
                      
                      
                      currentSelectedServiceDictLocal[currServicesObj.service_id] = currServicesObj.qty as AnyObject
                      
                      
                  }
                  
                  self.currentSelectedServiceDict = currentSelectedServiceDictLocal
                  
                  if let currentServiceObject = self.currentServicesObject {
                      let results = currentServiceObject.results
                      if results.count > 0 {
                          self.orderId = results[0].oid
                          
                      }
                    if let prevOrder = currentServiceObject.prevOrder {

                        self.updatePrevOrder(prevOrder)

                    }
                    
                    
                    
                  }

                  self.mainTableView.reloadData()
                  let generator = UISelectionFeedbackGenerator()
                  generator.selectionChanged()
                  //self.showContinueButton(true)
                  
                  
              }
              
              
              
          }
          
          
          
          
          
          
      }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
  
    
    func updatePrevOrder(_ obj : MyJDSubStagePrevOrderModel) {
        self.currentPrevOrder = obj
        if obj.proceed == 0 {
                self.nextButton.backgroundColor = UIColor.colorFromRGB(168, g: 179, b: 190)
            
        }else{
            
            self.nextButton.backgroundColor = UIColor.colorFromRGB(0, g: 118, b: 215)

        }
        self.parentSubStageVC?.updatePrevOrder(obj)
        
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
