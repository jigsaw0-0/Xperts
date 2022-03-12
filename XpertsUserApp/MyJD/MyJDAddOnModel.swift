

import Foundation
class MyJDAddOnModel: Mappable {
  
    var err_code : Int = 0
    var cnt : Int = 0
    var totPrice : Double = 0
    var totPriceText : String = ""
    var nextPage : String = ""
    var btnText : String = ""
    var skipBtn : String = ""
    var oid : String = ""
    var results : [MyJDAddOnResultModel] = []
    var prevOrder : MyJDSubStagePrevOrderModel?

    
    
    
    init(){
    }
    
    required init?(map: Map) {
    }
    // Mappable
    func mapping(map: Map) {
      
        err_code <- map["err_code"]
        cnt <- map["cnt"]
        totPrice <- map["totPrice"]
        totPriceText <- map["totPriceText"]

        nextPage <- map["nextPage"]
        btnText <- map["btnText"]
        skipBtn <- map["skipBtn"]
        oid <- map["oid"]
        results <- map["results"]
        prevOrder <- map["prevOrder"]

    }
}
