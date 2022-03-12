//
//  NetworkService.swift
//  TempXpertsApp
//
//  Created by Sriram S on 01/03/22.
//

import Foundation

public enum NetworkError : Error {
    case ParsingError
    case NoNetwork
    case ResultTypeMismatch
    case OtherError
    
}

public protocol NetworkService {
    
    func getRequest<T : Codable>(urlString : String) -> Swift.Result<T, NetworkError>

}
