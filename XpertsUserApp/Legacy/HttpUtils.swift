//
//  HttpUtils.swift
//  Justdial
//
//  Created by Swagat Kumar Bisoyi on 12/2/15.
//  Copyright © 2015 Swagat Kumar Bisoyi. All rights reserved.
//

import Foundation
import UIKit
// // // import Alamofire
open class HttpUtils {
    public static func plaingetJSONRequest(_ url: String, targetViewController: UIViewController?, completionHandler: @escaping UserUtils.responseJSONCompletionHandler){

        if targetViewController == nil {

            return
        }

        let isnetworkAvailable = checkConnectionAndDisplayError(targetViewController!)
        if isnetworkAvailable{

            var urlString = url



            request(urlString, method: .get,  parameters: nil, encoding: JSONEncoding.default)
                 .responseJSON { response in
                     switch response.result {
                     case .success(let value):
                         if let json = value as? NSDictionary // as? [String: Any]
                         {
                             completionHandler(json , nil)
                         }
                     case .failure(let error):
                         completionHandler(nil, error as NSError)

                     }
             }

        }else{





        }

    }

    public static func checkConnectionAndDisplayError(_ targetViewController: UIViewController) -> Bool{
        
        let isNetworkAvailable = Reachability()!.isReachable //Reachability.isConnectedToNetwork()
        if !isNetworkAvailable {
            
            
          //  UIApplication.shared.keyWindow!.makeToast("No network available".localizedString())

            
           
//            NONetworkObjectClass.displayNoNetwork(" No network", messageString: "No network", viewController: targetViewController)
            
   
        }else{
            
            
            
            
        }
        return isNetworkAvailable
    }
    
    
    public static func getRequest(_ url: String, targetViewController: UIViewController, completionHandler: @escaping UserUtils.responseStringCompletionHandler){
        let isNetworkAvailable = checkConnectionAndDisplayError(targetViewController)
        if isNetworkAvailable {
//            let headers = [
//                "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
//                "Content-Type": "application/x-www-form-urlencoded"
//            ]
//             request(.GET, url, parameters: nil, encoding: ParameterEncoding.URLEncodedInURL, headers: headers)
            
            request(url, method: .get).responseString(){
                response in
                completionHandler(response.result.value as String?, response.result.error as NSError?)
                print("Request: \(response.request); Response: \(response.response); Value: \(response.result)")
            }
        }else{
            
        }
    }
    
    
    public static func putRequest(_ url: String, targetViewController: UIViewController, completionHandler: @escaping UserUtils.responseStringCompletionHandler){
        let isNetworkAvailable = checkConnectionAndDisplayError(targetViewController)
        if isNetworkAvailable {
             request(url, method: .put).responseString(){
                response in
                completionHandler(response.result.value as String?, response.result.error as NSError?)
                print("Request: \(response.request); Response: \(response.response); Value: \(response.result)")
            }
        }else{
            
        }
    }
    public static func putRequestWithBody(_ url: String, targetViewController: UIViewController, completionHandler: @escaping UserUtils.responseStringCompletionHandler, body : Dictionary<String, String>){
        let isNetworkAvailable = checkConnectionAndDisplayError(targetViewController)
        if isNetworkAvailable {
             request(url, method: .put, parameters: body).responseString(){
                response in
                completionHandler(response.result.value as String?, response.result.error as NSError?)
                print("Request: \(response.request); Response: \(response.response); Value: \(response.result)")
            }
        }else{
            
        }
    }
    
    
    public static func postRequest(_ url: String, targetViewController: UIViewController, completionHandler: @escaping UserUtils.responseStringCompletionHandler){
        let isNetworkAvailable = checkConnectionAndDisplayError(targetViewController)
        if isNetworkAvailable {
             request(url, method: .post).responseString(){
                response in
                completionHandler(response.result.value as String?, response.result.error as NSError?)
                print("Request: \(response.request); Response: \(response.response); Value: \(response.result)")
            }
        }else{
            
        }
    }
    
    public static func postRequestWithBody(_ url: String, targetViewController: UIViewController, completionHandler: @escaping UserUtils.responseStringCompletionHandler, body : Dictionary<String, String>){
        let isNetworkAvailable = checkConnectionAndDisplayError(targetViewController)
        if isNetworkAvailable {
             request(url, method: .post, parameters: body).responseString(){
                response in
                completionHandler(response.result.value as String?, response.result.error as NSError?)
                print("Request: \(response.request); Response: \(response.response); Value: \(response.result)")
            }
        }else{
            
        }
    }
    
    public static func getJSONRequestWithoutCheck(_ url: String, targetViewController: UIViewController?, completionHandler: @escaping UserUtils.responseJSONCompletionHandler){
        
        if targetViewController == nil {
            
            return
        }
        
        if true{
            
            var urlString = url.replacingOccurrences(of: " ", with: "%20")
            if "\(GlobalData.userSid)" != "" {
                if let sid = urlString.sliceFrom("&sid=", to: "&")
                {
                    if sid == ""{
                        urlString = urlString.replacingOccurrences(of: sid, with: "\(GlobalData.userSid)")
                    }
                }else{
                    urlString = urlString + "&sid=\(GlobalData.userSid)&"
                }
            }
            if URL(string: urlString) == nil{
                urlString = urlString.replacingOccurrences(of: "%20", with: " ")
                urlString = urlString.URLEncodedString()!
            }
            
            
            
            request(urlString, method: .get).responseJSON(){
                response in
                completionHandler(response.result.value as? NSDictionary, response.result.error as NSError?)
            }
        }else{
            
            
            
            
            
        }
        
    }
    public static func getJSONRequest(_ url: String, targetViewController: UIViewController?, needsSid: Bool = true, completionHandler: @escaping UserUtils.responseJSONCompletionHandler){
        
        if targetViewController == nil {
            
            return
        }
        
        let isnetworkAvailable = checkConnectionAndDisplayError(targetViewController!)
        if isnetworkAvailable{
            
            var urlString = url.replacingOccurrences(of: " ", with: "%20")
            if "\(GlobalData.userSid)" != "" && needsSid {
                if let sid = urlString.sliceFrom("&sid=", to: "&")
                {
                    if sid == ""{
                        urlString = urlString.replacingOccurrences(of: sid, with: "\(GlobalData.userSid)")
                    }
                }else{
                    urlString = urlString + "&sid=\(GlobalData.userSid)&"
                }
            }
            if URL(string: urlString) == nil{
                urlString = urlString.replacingOccurrences(of: "%20", with: " ")
                urlString = urlString.URLEncodedString()!
            }
            
            print("url is \(urlString)")
            
             request(urlString, method: .get).responseJSON(){
                response in
                completionHandler(response.result.value as? NSDictionary, response.result.error as NSError?)
            }
        }else{
        }
    
    }

 
  
   
}
extension SessionManager{
    
    @discardableResult
    open func requestWithCacheOrLoad(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil)
        -> DataRequest
    {
        do {
            var urlRequest = try URLRequest(url: url, method: method, headers: headers)
            urlRequest.cachePolicy = .returnCacheDataElseLoad
            let encodedURLRequest = try encoding.encode(urlRequest, with: parameters)
            return request(encodedURLRequest)
        } catch {
            print(error)
            return request(URLRequest(url: URL(string: "https://example.com/wrong_request")!))
        }
    }
}
