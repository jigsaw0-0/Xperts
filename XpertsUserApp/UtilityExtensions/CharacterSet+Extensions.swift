//
//  CharacterSet+Extensions.swift
//  TempXpertsApp
//
//  Created by Sriram S on 04/03/22.
//

import Foundation


extension CharacterSet {

    static func URLQueryParameterAllowedCharacterSet() -> CharacterSet {
//        return self.`init`(charactersIn:)(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~/?%$")
        return self.init(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~/?%$")
    }

}
