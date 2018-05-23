//
//  ConstFunction.swift
//  HackPoin
//
//  Created by Globaltium on 22/05/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import Foundation
import UIKit
import Toast_Swift

class ConstFunction{
    
    static func getScreenHeight() -> CGFloat {
        let bounds = UIScreen.main.bounds
        return bounds.size.height
    }
    
    static func getScreenWidth() -> CGFloat {
        let bounds = UIScreen.main.bounds
        return bounds.size.width
    }
    
    static func getFormattedDate(inputDateString: String, dateFormatString: String) -> Date {
        let df = DateFormatter()
        df.dateFormat = dateFormatString
        df.locale = NSLocale(localeIdentifier: "en_US") as Locale!
        let dateFormatted: Date = df.date(from: inputDateString)!
        
        return dateFormatted
    }
    
    static func getFormattedDateString(inputDateString: String) -> String {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        df.locale = NSLocale(localeIdentifier: "en_US") as Locale!
        let dateFormatted: Date = df.date(from: inputDateString)!
        df.dateFormat = "yyyy-MM-dd hh:mm:ss a"
        df.amSymbol = "AM"
        df.pmSymbol = "PM"
        let dfString: String = df.string(from: dateFormatted)
        
        return dfString
    }
    
    static func showSimpleAlertDialog(vc: UIViewController, msg: String, title: String = "Alert") {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
//    static func showText(vc: UIViewController, msg: String) {
//        let toastView = Bundle.main.loadNibNamed("CustomToastView", owner: nil, options: nil)?[0] as? CustomToastView
//        toastView?.frame = CGRect(x: 0, y: 0, width: vc.view.frame.size.width * 0.8 , height: 50)
//
//        let labelHight = heightForView(text: msg, width: (toastView?.frame.width)!)
//        toastView?.frame.size.height = labelHight + 16.0
//
//        toastView?.toastMessageLabel.text = msg
//
//        vc.view.showToast(toastView!, duration: 2.0, position: .bottom, completion: nil)
//
//    }
    
    static func heightForView(text: String, width: CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = text
        
        label.sizeToFit()
        return label.frame.height
    }
    
    
}
