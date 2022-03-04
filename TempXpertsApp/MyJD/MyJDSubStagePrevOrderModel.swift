//
//  UpperTabModelSocial.swift
//  Riot
//
//  Created by Sriram S on 02/07/19.
//  Copyright © 2019 matrix.org. All rights reserved.
//

import Foundation
class MyJDSubStagePrevOrderModel: Mappable {
  
    
    
    
    
    var proceed : Int = 1
    
    
    var cnt : CLong = 0
    var mainCnt : CLong = 0
    
    var totPrice : Double = 0
    var totMainPrice : Double = 0
    var totPriceText : String = ""
    var btnText : String = ""
    var ncatid : String = ""
    var oid : String = ""
    var nextPage : String = ""
    var prevOrder : MyJDSubStagePrevOrderModel?
    var orderDetails : [MyJDSubStagePrevOrderDetailsModel]?
    var nextPageAddon : String = ""
    var pageTotalPriceText : String = ""
    init(){
    }
    
    required init?(map: Map) {
    }
    // Mappable
    func mapping(map: Map) {
        proceed <- map["proceed"]

        mainCnt <- map["mainCnt"]
        totMainPrice <- map["totMainPrice"]
        
        cnt <- map["cnt"]
        totPrice <- map["totPrice"]
        totPriceText <- map["totPriceText"]
        btnText <- map["btnText"]
        ncatid <- map["ncatid"]
        oid <- map["oid"]
        nextPage <- map["nextPage"]
        prevOrder <- map["prevOrder"]
        orderDetails <- map["orderDetails"]
        nextPageAddon <- map["nextPageAddon"]
        pageTotalPriceText <- map["pageTotalPriceText"]
    }
    
}
