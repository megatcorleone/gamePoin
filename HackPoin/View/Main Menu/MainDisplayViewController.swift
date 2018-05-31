//
//  MainDisplayViewController.swift
//  HackPoin
//
//  Created by Globaltium on 21/05/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit
import LGSideMenuController

class MainDisplayViewController: UIPageViewController {
    
    
    static func createView() -> MainDisplayViewController {
        return MainDisplayViewController.instantiate(fromAppStoryboard: .Main)
    }
    
    static var mainDisplay:MainDisplayViewController = MainDisplayViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()

     MainDisplayViewController.mainDisplay = self
        
        SlideMenuViewController.maindisplay = self

    }


   
}
