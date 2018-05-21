//
//  ConstData.swift
//  HackPoin
//
//  Created by Globaltium on 07/05/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit
import SwiftyJSON

struct ConstData {

    
//    static let GOOGLE_SIGN_IN_NC = "google_sign_in"
    
    static let CLIENT_SECRET="gUWh1tz-eVbavf1j10U3_dYJwE-juV6N"
    static let CLIENT_id="745414701667712"
    static let API_USERNAME="wesley.tan@globaltium.com"
    static let API_PWD="12345678"
    
    static let SERVER="http://hackpoin.xenopay.asia/api/web/v1"
    
    static let UPDATE="\(SERVER)/users/register"
    
    static let debugMode:Bool = true
    
    static let GET_TOKEN="\(SERVER)/auth/get-token"
    
    static let DEVICE_id="android"

    
    static let LANGUAGE = "EN"
    
    static var avatar_url: String?
    
    static var user_id: String?
    
    static var userJsonProfile: JSON?
    


    
    
}
