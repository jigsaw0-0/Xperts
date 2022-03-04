//
//  GlobalFuncs.swift
//  TempXpertsApp
//
//  Created by Sriram S on 04/03/22.
//

import Foundation
import UIKit


public func cancelAndFireNewToast(_ str : String) {
    if false {
        UIApplication.shared.keyWindow!.hideAllToasts()
        UIApplication.shared.keyWindow!.makeToast(str)
    }
}

func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}
