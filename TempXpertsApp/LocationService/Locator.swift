//
//  Locator.swift
//  TempXpertsApp
//
//  Created by Sriram S on 02/03/22.
//

import Foundation
import Combine
import CoreLocation


public protocol Locator {
    
    func getCurrentLocation() -> Future<CLLocation, Never>
    func getDummyInt() -> Future<Int, Never>
}

