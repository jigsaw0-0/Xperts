//
//  UpperTabModelSocial.swift
//  Riot
//
//  Created by Sriram S on 02/07/19.
//  Copyright © 2019 matrix.org. All rights reserved.
//

import Foundation
class MyJDSubStagePrevOrderDetailsModel: Mappable {
  
    var sId : String = ""
    var catId : String = ""
    var sName : String = ""
    var catName : String = ""
    var rootCatid : String = ""
    var rootCatName : String = ""
    var qty : Int = 0

  
    init(){
    }
    
    required init?(map: Map) {
    }
    // Mappable
    func mapping(map: Map) {
      
        sId <- map["sId"]
        catId <- map["catId"]
        sName <- map["sName"]
        catName <- map["catName"]
        rootCatid <- map["rootCatid"]
        rootCatName <- map["rootCatName"]
        qty <- map["qty"]
       

    }
}
