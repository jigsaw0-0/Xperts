

import Foundation
class MyJDCurrentSelectedServicesResultModel: Mappable {
  
    var totPrice : Double = 0
    var totPriceText : String = ""
    var cnt : Int = 0
    var btnText : String = ""
    var ncatid : String = ""
    var oid : String = ""
    var addedText: [String] = []
    var prevOrder : [String:String] = [:]
  
    init(){
    }
    
    required init?(map: Map) {
    }
    // Mappable
    func mapping(map: Map) {
      
        totPrice <- map["totPrice"]
        totPriceText <- map["totPriceText"]
        cnt <- map["cnt"]
        btnText <- map["btnText"]
        ncatid <- map["ncatid"]
        oid <- map["oid"]
        addedText <- map["addedText"]
        //oid <- map["oid"]
        prevOrder <- map["prevOrder"]

    }
}
