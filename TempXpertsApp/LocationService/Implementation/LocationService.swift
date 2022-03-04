//
//  LocationService.swift
//  TempXpertsApp
//
//  Created by Sriram S on 02/03/22.
//

import Foundation
import Combine
import CoreLocation

class LocationService : Locator {
    func getCurrentLocation() -> Future<CLLocation, Never> {

        return Future { promise in
            
            promise(.success(CLLocation()))
          //  promise(.success(C))
        }

    }

    func getDummyInt() -> Future<Int, Never> {
        
        return Future { promise in
            print("Closure Executed!!")
            promise(.success(1001))
        }
        
    }
}
