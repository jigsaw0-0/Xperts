//
//  UpperTabModelSocial.swift
//  Riot
//
//  Created by Sriram S on 02/07/19.
//  Copyright © 2019 matrix.org. All rights reserved.
//

import Foundation
class MyJDSubStageDataResultElement: Mappable {
  
    
    var sName : String = ""
    var sMrpPrice : Double = 0
    var sOfferPrice : Double = 0
    var sDuration : String = ""
    var sSdimg : [String] = []
    var sDesc : [MyJDSubStageDataResultsDescModel] = []
    var sType : String = ""
    var hotsellerText : String = ""
    var btnText : String = ""
    var api : String = ""
    var sId : String = ""
    var editPackage : Int = 0
    var prevOrder : [MyJDSubStageDataResultsDescModel] = []
    var qty : CLong = 0
    var viewDetails : Int = 0
    var gPeriod : Dictionary<String, String> = [:]
  
    init(){
    }
    
    required init?(map: Map) {
    }
    // Mappable
    func mapping(map: Map) {
      
        sName <- map["sName"]
        sMrpPrice <- map["sMrpPrice"]
        sOfferPrice <- map["sOfferPrice"]
        sDuration <- map["sDuration"]
        sSdimg <- map["sSdimg"]
        sDesc <- map["sDesc"]
        sType <- map["sType"]
        hotsellerText <- map["hotsellerText"]
        btnText <- map["btnText"]
        api <- map["api"]
        sId <- map["sId"]
        editPackage <- map["editPackage"]
        prevOrder <- map["prevOrder"]
        qty <- map["qty"]
        viewDetails <- map["viewDetails"]
        gPeriod <- map["gPeriod"]


    }
}
