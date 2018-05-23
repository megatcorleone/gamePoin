//
//  SlideMenuViewController.swift
//  HackPoin
//
//  Created by Globaltium on 22/05/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit
import LGSideMenuController
import RxSwift
import RxGesture

class SlideMenuViewController: LGSideMenuController {
    
    var rootVc: HomePageViewController=HomePageViewController()
    
   static var maindisplay: MainDisplayViewController=MainDisplayViewController()
    
    static func createView() -> SlideMenuViewController {
        return SlideMenuViewController.instantiate(fromAppStoryboard: .Main)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        /**
         Start Slide Drawer Menu
         **/
        self.rootVc=HomePageViewController.createView()
        self.rootVc.mainView=self
        
        let rootNvc: UINavigationController = UINavigationController()
        rootNvc.viewControllers = [self.rootVc]
        rootNvc.setNavigationBarHidden(true, animated: false)
        
        
        let leftSideMenuVc = LeftSlideViewController.createView()
        leftSideMenuVc.mainView = self
        
        
        self.leftViewWidth = ConstFunction.getScreenWidth() * 0.75
        self.leftViewPresentationStyle = .slideBelow
        self.leftViewBackgroundBlurEffect = UIBlurEffect(style: .light)
        self.isLeftViewStatusBarHidden = false
        
        self.rootViewController = rootNvc
        self.leftViewController = leftSideMenuVc
        
        /**
         End Slide Drawer Menu
         **/
        
        
  
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  

    
}
