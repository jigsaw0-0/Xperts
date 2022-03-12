//
//  UpperTabModelSocial.swift
//  Riot
//
//  Created by Sriram S on 02/07/19.
//  Copyright © 2019 matrix.org. All rights reserved.
//

import Foundation
class MyJDSubStageModel: Mappable {
  
    
    var prevOrder : MyJDSubStagePrevOrderModel?
    var err_code : Int = 0
    var header : String = ""
    var view : String = ""
    var ncatid : String = ""
    var data : [MyJDSubStageDataElement] = []
    var footerText : String = ""
    var dd : [MyJDSubStageDDModelObject] = []
    init(){
    }
    
    required init?(map: Map) {
    }
    // Mappable
    func mapping(map: Map) {
        footerText <- map["footerText"]
        prevOrder <- map["prevOrder"]
        err_code <- map["err_code"]
        header <- map["header"]
        view <- map["view"]
        ncatid <- map["ncatid"]
        data <- map["data"]
        dd <- map["dd"]

    }
}
