//
//  APIRequest.swift
//  HackPoin
//
//  Created by Globaltium on 07/05/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import JSONParserSwift

class APIRequest{
    
    static func JSONObject(jsonStr: String) -> JSON{
        return JSON(jsonStr)
        
        
    }
    
    static let reqUrl:String = "http://hackpoin.xenopay.asia/api/web/v1"
    
    static func postJSONReq(reqUrl:String, headerParams: [String: String], inputParams: [String: String], success: @escaping (_ result: JSON) -> Void, failure: @escaping (_ message: String) -> Void, debug: Bool) {
        
        if debug {
            
            print("====================================")
            print("postJSONRequest: [\(reqUrl)]")
            
            for (key, value) in inputParams {
                print("postJSONRequest: [\(key)] = \(value)")
            }
            
            do{
                for (key, value) in headerParams {
                    print("postHeader: [\(key)] = \(value)")
                }
            }catch{
                
            }
            print("=====================================")
        }
        
        var headers: HTTPHeaders = [:]
        do{
            for (key, value) in headerParams {
                headers["\(key)"] = "\(value)"
            }
        }
        catch{
            
        }
        
        
        
        Alamofire.request(
            reqUrl,
            method: .post,
            parameters: inputParams,
            headers: headers)
            .responseJSON { response in
                let apiDataErrorMsg: String = "Data error"
                
                if response.result.value != nil {
                    if debug {
                        print("======================================")
                        print("[Response]: \(response.result.value!)")
                        print("======================================")
                    }
                    
                    
                    
                    
                    let jsonResponse = JSON(response.result.value!)
                    
                 //  defaultsKeys.access_token = "\(jsonResponse["access_token"])"
                    
                      //print("Server Output Parser: \(jsonResponse["success"])")
                    /**
                     print("Server Output Parser: \(jsonResponse["accesstoken"])")
                     if jsonResponse["success"].boolValue {
                     
                     print("............. 1st Loop JsonArray Method...............")
                     for (key, value) in jsonResponse["data"] {
                     print("[\(key)] = \(value)")
                     }
                     
                     
                     
                     print("............. 2nd Loop JsonArray Method...............")
                     
                     let tmpStr = jsonResponse["data"].array?[0]["wechat_msg"]
                     print("\(tmpStr!)")
                     
                     
                     print("............. 3th Loop JsonArray Method...............")
                     
                     let jsonArray = jsonResponse["data"].array
                     for (index, _) in (jsonArray?.enumerated())! {
                     let tmpStr = jsonResponse["data"].array?[index]["wechat_msg"]
                     print("[\(index)] = \(tmpStr!)")
                     }
                     
                     }
                     **/
                    
                    
                    success(jsonResponse)
                } else {
                    failure(apiDataErrorMsg)
                }
        }
    }
    
    static func JSONReq(reqUrl:String, method:HTTPMethod, headerParams: [String: String], inputParams: [String: String], success: @escaping (_ result: JSON) -> Void, failure: @escaping (_ message: String) -> Void, debug: Bool) {
        
        if debug {
            
            print("====================================")
            print("postJSONRequest: [\(reqUrl)]")
            
            for (key, value) in inputParams {
                print("postJSONRequest: [\(key)] = \(value)")
            }
            
            do{
                for (key, value) in headerParams {
                    print("postHeader: [\(key)] = \(value)")
                }
            }catch{
                
            }
            print("=====================================")
        }
        
        var headers: HTTPHeaders = [:]
        do{
            for (key, value) in headerParams {
                headers["\(key)"] = "\(value)"
            }
        }
        catch{
            
        }
        
        Alamofire.request(
            reqUrl,
            method: method,
            parameters: inputParams,
            headers: headers)
            .responseJSON { response in
                let apiDataErrorMsg: String = "Data error"
                
                if response.result.value != nil {
                    if debug {
                        print("======================================")
                        print("[Response]: \(response.result.value!)")
                        print("======================================")
                    }
                    
                    
                    
                    let jsonResponse = JSON(response.result.value!)
                    
                   // defaultsKeys.access_token = "\(jsonResponse["access_token"])"
                    
                //     print("Server Output Parser: \(jsonResponse["success"])")
                    /**
                     print("Server Output Parser: \(jsonResponse["accesstoken"])")
                     if jsonResponse["success"].boolValue {
                     
                     print("............. 1st Loop JsonArray Method...............")
                     for (key, value) in jsonResponse["data"] {
                     print("[\(key)] = \(value)")
                     }
                     
                     
                     
                     print("............. 2nd Loop JsonArray Method...............")
                     
                     let tmpStr = jsonResponse["data"].array?[0]["wechat_msg"]
                     print("\(tmpStr!)")
                     
                     
                     print("............. 3th Loop JsonArray Method...............")
                     
                     let jsonArray = jsonResponse["data"].array
                     for (index, _) in (jsonArray?.enumerated())! {
                     let tmpStr = jsonResponse["data"].array?[index]["wechat_msg"]
                     print("[\(index)] = \(tmpStr!)")
                     }
                     
                     }
                     **/
                    
                    
                    success(jsonResponse)
                } else {
                    failure(apiDataErrorMsg)
                }
        }
    }
    
    
}

