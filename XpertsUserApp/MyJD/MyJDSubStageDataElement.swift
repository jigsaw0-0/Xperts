//
//  UpperTabModelSocial.swift
//  Riot
//
//  Created by Sriram S on 02/07/19.
//  Copyright © 2019 matrix.org. All rights reserved.
//

import Foundation
class MyJDSubStageDataElement: Mappable {
  
    
    
    var key : String = ""
    var ncatid : String = ""
    var result : [MyJDSubStageDataResultElement] = []
    var catid : String = ""
    var covid : Dictionary<String, String> = [:]
    var banner : Dictionary<String, String> = [:]

  
    init(){
    }
    
    required init?(map: Map) {
    }
    // Mappable
    func mapping(map: Map) {
      
        key <- map["key"]
        ncatid <- map["ncatid"]
        result <- map["result"]
        catid <- map["catid"]
        covid <- map["covid"]
        banner <- map["banner"]

       
    }
}
