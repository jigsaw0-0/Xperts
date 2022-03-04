//
//  UpperTabModelSocial.swift
//  Riot
//
//  Created by Sriram S on 02/07/19.
//  Copyright © 2019 matrix.org. All rights reserved.
//

import Foundation
class MyJDCurrServicesModel: Mappable {
  
    var service_id : String = ""
    var qty : String = ""
    var addedText : [String] = []
  
    init(){
    }
    
    required init?(map: Map) {
    }
    // Mappable
    func mapping(map: Map) {
      
        service_id <- map["service_id"]
        qty <- map["qty"]
        addedText <- map["addedText"]

    }
}
