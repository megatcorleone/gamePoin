//
//  LeftSlideViewController.swift
//  HackPoin
//
//  Created by Globaltium on 21/05/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit
import RxSwift
import RxGesture
import LGSideMenuController

class LeftSlideViewController: UIViewController {
    
    
    
    var mainView: SlideMenuViewController? = nil
    static func createView() -> LeftSlideViewController {
        return LeftSlideViewController.instantiate(fromAppStoryboard: .Main)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
}
