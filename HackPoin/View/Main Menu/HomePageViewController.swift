//
//  HomePageViewController.swift
//  HackPoin
//
//  Created by Globaltium on 21/05/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit
import RxSwift
import RxGesture
import LGSideMenuController


class HomePageViewController: UIViewController {
    
    @IBOutlet weak var slideMenuBtn: UIButton!
    
    
    
    @IBAction func homeBtn(_ sender: Any) {
                MainDisplayViewController.mainDisplay.setViewControllers([MainMenuViewController.createView()], direction: .forward, animated: true, completion: nil)
        
        
    }
    
    var mainView: SlideMenuViewController? = nil
    static func createView() -> HomePageViewController {
        return HomePageViewController.instantiate(fromAppStoryboard: .Main)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        onClick(clickView: self.slideMenuBtn, clickIndex: self.LEFT_MENU)


    }

    /**
     User OnClick Method Start
     **/
    let disposeBag: DisposeBag = DisposeBag()
    let LEFT_MENU = 0
    
    func onClick(clickView: UIButton, clickIndex: Int){
        clickView.rx.tapGesture().when(.recognized).subscribe(onNext: { _ in
            self.handleTap(tapIndex: clickIndex)
        })
            .addDisposableTo(self.disposeBag)
    }
    
    func handleTap(tapIndex: Int) {
        switch tapIndex {
        case LEFT_MENU:
            self.sideMenuController?.showLeftView(animated: true, completionHandler: nil)
            break
        default:
            break
        }
    }
    
    /**
     User OnClick Method End
     **/
    
    
}
