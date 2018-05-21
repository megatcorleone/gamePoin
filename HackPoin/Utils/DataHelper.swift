//
//  DataHelper.swift
//  HackPoin
//
//  Created by Globaltium on 07/05/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

struct defaultsKeys {
    static let keyOne = "firstStringKey"
    static let keyTwo = "secondStringKey"
    
    static var access_token = ""
    static let isFirst = "isFirst"
}

class DataHelper{
    
    
    static func saveData(key:String, value:String){
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
    }
    
    static func loadData(key:String) -> String{
        let defaults = UserDefaults.standard
        if let stringOne = defaults.string(forKey: key) {
            return stringOne
        }
        return ""
    }
}

