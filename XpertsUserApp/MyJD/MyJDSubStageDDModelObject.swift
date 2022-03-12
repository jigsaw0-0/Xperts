
//
//  Created by Sriram S on 02/07/19.
//  Copyright © 2019 matrix.org. All rights reserved.
//

import Foundation
class MyJDSubStageDDModelObject: Mappable {
  
    
    var lbl : String = ""
    var link : String = ""
    var urlparams : Dictionary<String, String> = [:]
    var checked : Int = 0
  
    init(){
    }
    
    required init?(map: Map) {
    }
    // Mappable
    func mapping(map: Map) {
        lbl <- map["lbl"]
        link <- map["link"]
        urlparams <- map["urlparams"]
        checked <- map["checked"]

    }
}
