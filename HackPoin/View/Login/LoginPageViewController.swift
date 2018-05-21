//
//  LoginPageViewController.swift
//  HackPoin
//
//  Created by Globaltium on 23/04/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import PopupDialog
import DynamicBlurView


class LoginPageViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var fpView: UIView!
    
    
    @IBOutlet weak var containView: UIView!
    
    
    @IBOutlet weak var centerPopup: NSLayoutConstraint!
    
    
    @IBOutlet weak var phoneNumber: SkyFloatingLabelTextField!
    
    @IBOutlet weak var userPassword: SkyFloatingLabelTextField!
    
    @IBAction func forgotPassword(_ sender: Any) {
        
        let blurView1 = DynamicBlurView(frame: view.bounds)
        blurView1.blurRadius = 3
        blurView1.blendColor = .black

   
   
        topView.addSubview(blurView1)
        

        let blurView2 = DynamicBlurView(frame: view.bounds)
        blurView2.blurRadius = 3
        bottomView.addSubview(blurView2)
        
//        topView.alpha = 0.5
//        bottomView.alpha = 0.5
//        topView.backgroundColor = .clear
//        bottomView.backgroundColor = .clear
        
        
        centerPopup.constant = 0
        UIView.animate(withDuration: 0.3, animations:{ self.view.layoutIfNeeded()
        })

        
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        
         dismiss(animated: true, completion: nil)

        let blurView3 = DynamicBlurView(frame: view.bounds)
        blurView3.blurRadius = 0
        blurView3.removeFromSuperview()
        //topView.addSubview(blurView3)
        



        let blurView4 = DynamicBlurView(frame: view.bounds)
        blurView4.blurRadius = 3
        bottomView.willRemoveSubview(bottomView)
       
        

        
        
//        topView.alpha = 1
//        bottomView.alpha = 1
        centerPopup.constant = -500
        UIView.animate(withDuration: 0.1, animations:{ self.view.layoutIfNeeded()
        })
        
   
        
       
        

        
        
    
    }
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    

        

        

    }

    
//    func showCustomDialog(animated: Bool = true) {
//
//        // Create a custom view controller
//        let forgot = ForgotPasswordViewController(nibName: "ForgotPassword", bundle: nil)
//
//        // Create the dialog
//        let popup = PopupDialog(viewController: forgot, buttonAlignment: .horizontal, transitionStyle: .bounceUp, gestureDismissal: true)
//        popup.view.backgroundColor = UIColor.clear
//
//        let overlayAppearance = PopupDialogOverlayView.appearance()
//        overlayAppearance.color  = .black
//        overlayAppearance.blurRadius = 3
//        overlayAppearance.blurEnabled = true
//        overlayAppearance.liveBlur = false
//        overlayAppearance.opacity = 0.7
//
//        // Present dialog
//        present(popup, animated: animated, completion: nil)
//    }
//    

    
}




extension SkyFloatingLabelTextField {
    
    
    @IBInspectable var titleUpperCase: Bool {
        get {
            return self.titleUpperCase
        }
        
        set {
            if !newValue {
                self.titleFormatter = { $0 }
            }
        }
    }
}

extension UIView {
    @IBInspectable var borderWidth : CGFloat {
        set {
            layer.borderWidth = newValue
        }
        
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
}
