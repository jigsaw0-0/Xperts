//
//  UpperTabModelSocial.swift
//  Riot
//
//  Created by Sriram S on 02/07/19.
//  Copyright © 2019 matrix.org. All rights reserved.
//

import Foundation
class MyJDSubStageDataResultsDescModel: Mappable {
  
    var title : String = ""
    var description : String = ""
    var subTextFlag = false
    var id : Int = 0
    var text : String = ""
    var lineBelow = false
    
    
    init(){
    }
    
    init(_ title : String, description : String, subTextFlag : Bool){
        self.title = title
        self.description = description
        self.subTextFlag = subTextFlag
        
    }
    
    required init?(map: Map) {
    }
    // Mappable
    func mapping(map: Map) {
      
        title <- map["title"]
        description <- map["description"]
        subTextFlag <- map["subTextFlag"]
        id <- map["id"]
        text <- map["text"]




    }
}
