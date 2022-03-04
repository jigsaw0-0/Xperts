//
//  XpertContainer.swift
//  TempXpertsApp
//
//  Created by Sriram S on 04/03/22.
//

import Foundation
import UIKit


class XpertContainer {
    
    private init() {}
    
    static let shared = XpertContainer()
    
    class func getXpertSampleCatogoryPage() -> MyJDSubStageController {
        
        
        let subStageVc = UIStoryboard(name: "MyJDSubStageStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "MyJDSubStageController") as! MyJDSubStageController
        
        subStageVc.urlParams = ["passKey" : "catid", "passValue" : "2001"] as Dictionary<String, AnyObject>
        subStageVc.ncatid = "10890481"
        subStageVc.catTitle = "AC Repair & Service"
        
        return subStageVc
        
    }
    
}

