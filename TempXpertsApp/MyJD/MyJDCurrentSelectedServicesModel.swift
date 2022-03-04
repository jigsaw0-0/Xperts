//
//  UpperTabModelSocial.swift
//  Riot
//
//  Created by Sriram S on 02/07/19.
//  Copyright © 2019 matrix.org. All rights reserved.
//

import Foundation
class MyJDCurrentSelectedServicesModel: Mappable {
  
    var err_code : Int = 0
    var currServices : [MyJDCurrServicesModel] = []
    var popUp : Int = 0
    var results : [MyJDCurrentSelectedServicesResultModel] = []
    var nextPage : String = ""
    var prevOrder : MyJDSubStagePrevOrderModel?

  
    init(){
    }
    
    required init?(map: Map) {
    }
    // Mappable
    func mapping(map: Map) {
      
        err_code <- map["err_code"]
        currServices <- map["currServices"]
        popUp <- map["popUp"]
        results <- map["results"]
        nextPage <- map["nextPage"]
        prevOrder <- map["prevOrder"]

    }
}
