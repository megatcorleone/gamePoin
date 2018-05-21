//
//  UpdatePageViewController.swift
//  HackPoin
//
//  Created by Globaltium on 03/05/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import RxSwift
import RxCocoa
import JSONParserSwift
import SwiftyJSON
import RxGesture
import Toast_Swift



class UpdatePageViewController: UIViewController {
    
    

    
    
    @IBOutlet weak var nameUser: SkyFloatingLabelTextField!
    
    
    @IBOutlet weak var emailUser: SkyFloatingLabelTextField!
    
    @IBOutlet weak var password: SkyFloatingLabelTextField!
    
    
    @IBOutlet weak var confirmPassword: SkyFloatingLabelTextField!
    
    

    @IBAction func saveBtn(_ sender: Any) {
        
        
         register()
    }
    
    
//    func save(){
//
//
//        var reqData: [String: Any] = [:]
//
//
//
//        var headers: [String: String] = [:]
//        headers["Authorization"] = "Bearer \(DataHelper.loadData(key: defaultsKeys.access_token))"
//
//
//    }
    
    /**
     User OnClick Method Start
     **/
    let disposeBag: DisposeBag = DisposeBag()
    let ACTION_NAME = 0
    let ACTION_EMAIL = 1
    let ACTION_PASSWORD = 2
    let ACTION_CONFIRM = 3
    
//    func onClick(clickView: UIView, clickIndex: Int){
//        clickView.rx.tapGesture().when(.recognized).subscribe({ _ in
//            self.handleTap(tapIndex: clickIndex)
//        })
//            .addDisposableTo(self.disposeBag)
//    }

        
        
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        onClick(clickView: self.nameUser, clickIndex: ACTION_NAME )
//        onClick(clickView: self.emailUser, clickIndex: ACTION_EMAIL)
//        onClick(clickView: self.password, clickIndex: ACTION_PASSWORD)
//        onClick(clickView: self.confirmPassword, clickIndex: ACTION_CONFIRM)
        
     getAccessToken()
    }
    
    func getAccessToken(){
        //HTTP Request Start
        
        var reqData: [String: String] = [:]
        //reqData["grant_type"] = "password"
        reqData["email"] = ConstData.API_USERNAME
        reqData["password"] = ConstData.API_PWD
        reqData["client_id"] = ConstData.CLIENT_id
        reqData["client_secret"] = ConstData.CLIENT_SECRET
        reqData["device_id"] = ConstData.DEVICE_id
        
        //let accessToken = "abcdefg"
        var headers: [String: String] = [:]
        headers["Authorization"] = "Bearer \(defaultsKeys.access_token)"
        
        
        self.showLoading()
        
        APIRequest.postJSONReq(reqUrl: ConstData.GET_TOKEN, headerParams: headers, inputParams: reqData, success: { (result: JSON) in
            self.dismissLoading{
                if ConstData.debugMode{
                    print("Get Token Server Output \(result)")
                }
                
                do {

                 
                    defaultsKeys.access_token = "\(result["access_token"].rawValue as! String)"
//                    print("Server Output GSON like Parser: \(responseData.access_token!)")
                    

                    
                    
                } catch {
                    print(error)
                }
                
                //
                
                //   print("Server Output Parser Token: \(result["access_token"])")
                
                // print("Server Output Parser: \(jsonResponse["access_token"])")
                
            }
        }, failure: { (msg: String) in
            self.dismissLoading{
                print("Server Error \(msg)")
            }
            
        }, debug: true)
    
    
//    func handleTap(tapIndex: Int) {
//        switch tapIndex {
//
//
//            //Action Name
//
//        case ACTION_NAME:
//            print("Action Name" )
//            self.nameUser.resignFirstResponder()
//
//
//            if ((nameUser?.text) != nil){
//                self.view.makeToast("Name must not be empty", duration: 3.0, position: .bottom)
//                return
//            }
//
//            break
//
//
//            //Action Email
//        case ACTION_EMAIL:
//            self.emailUser.resignFirstResponder()
//
////            if emailUser?.count == 0{
////                self.view.makeToast("District List not available", duration: 3.0, position: .bottom)
////                return
////            }
//
//
//            break
//
//
//            //Action Password
//
//
//        case ACTION_PASSWORD:
//            self.password.resignFirstResponder()
//
////            if subdistrictList?.count == 0{
////                self.view.makeToast("Sub-District List not available", duration: 3.0, position: .bottom)
////                return
////            }
//
//
//            break
//
//
//            //Action Confirm Password
//
//        case ACTION_CONFIRM:
//            self.confirmPassword.resignFirstResponder()
////            if moobanList?.count == 0{
////                self.view.makeToast("MooBan List not available", duration: 3.0, position: .bottom)
////                return
////            }
//
//        default:
//            break
//        }
//    }
    
    
   
    
    }
    
    func register(){
        
        
        var reqData: [String: String] = [:]
        

        reqData["name"] = self.nameUser.text
        reqData["email"] = self.emailUser.text
        reqData["password"] = self.password.text
        reqData["password_repeat"] = self.confirmPassword.text
        
        
        //let accessToken = "abcdefg"
        var headers: [String: String] = [:]
        headers["Authorization"] = "Bearer \(defaultsKeys.access_token)"
        
        
        self.showLoading()
        
        APIRequest.postJSONReq(reqUrl: ConstData.GET_TOKEN, headerParams: headers, inputParams: reqData, success: { (result: JSON) in
            self.dismissLoading{
                if ConstData.debugMode{
                    print("Get Token Server Output \(result)")
                }
                do {

                    
                    print("Error: \(result["message"])")
                    
                    if  result["message"] != nil{
                        if result["errors"] != nil{
                            if result["errors"]["email"] != nil{
                                self.view.makeToast("\(result["errors"]["email"][0])", duration: 3.0, position: .bottom)
                            }
                            if result["errors"]["password"] != nil{
                                self.view.makeToast("\(result["errors"]["password"][0])", duration: 3.0, position: .bottom)
                            }
                            if result["errors"]["password_confirmation"] != nil{
                                self.view.makeToast("\(result["errors"]["password_confirmation"][0])", duration: 3.0, position: .bottom)
                            }
                            if result["errors"]["name"] != nil{
                                self.view.makeToast("\(result["errors"]["name"][0])", duration: 3.0, position: .bottom)
                            }
                            
                            
                            
                        }
                    }
                    
                    if result["data"] != nil{
                        self.view.makeToast("Register Successfull", duration: 3.0, position: .bottom)
                        
//                        let vc = LoginViewController.createView()
//                        RootPageViewController.rootNavi.setViewControllers([vc], direction: .forward, animated: true, completion: nil)
                    }
                    
                    
                } catch {
                    print(error)
                }
                

                
            }
        }, failure: { (msg: String) in
            self.dismissLoading{
                print("Server Error \(msg)")
            }
            
        }, debug: true)
    }


    

    
  
    }
        

