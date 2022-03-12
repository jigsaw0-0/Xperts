//
//  ReachabilitydStatusManager.swift
//  Justdial
//
//  Created by Swagat Kumar Bisoyi on 1/28/16.
//  Copyright © 2016 Swagat Kumar Bisoyi. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class ReachabilitydStatusManager {
    /* Singleton */
    static let sharedReachabilitydStatusManager = ReachabilitydStatusManager()
    
   
    //flag is notification is registered
    fileprivate var notificationRegisterd = false
    // last update time of network status
    var lastUpdatedTime : Date = Date()
    var reachability : Reachability = Reachability()!//Reachability.reachabilityForInternetConnection()!
    func startNotifier(){
        
//        if (!self.notificationRegisterd){
//            NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityUpdated:", name: kReachabilityChangedNotification, object: nil)
//        }
        
        do {
            reachability =  Reachability()! //.reachabilityForInternetConnection()!
//            reachability.startNotifier()
            do {
                try reachability.startNotifier()
            }
            catch{
                print("Error")
            }

        }
//        catch let error as NSError {
//            print(error.description)
//        }

    }
    
    /// remove all notification observer
    deinit{
//        NSNotificationCenter.defaultCenter().removeObserver(self, name: kReachabilityChangedNotification, object: nil)
    }
    
    func reachabilityUpdated(_ notification : Notification){

        //update last update time
        self.lastUpdatedTime = Date()
        //If network is NotReachable suspand current reportqueue
//        let object : Reachability = notification.object as! Reachability
//        let status = object.currentReachabilityStatus()
//        if(status == NetworkStatus.NotReachable){
//            ReportIssueQueueManager.sharedReportIssueQueueManager.suspend()
//           
//        }else{
//            ReportIssueQueueManager.sharedReportIssueQueueManager.resume()
//        }
        
    }
}
