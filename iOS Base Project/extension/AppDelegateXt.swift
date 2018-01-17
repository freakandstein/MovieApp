//
//  AppDelegateXt.swift
//  iOS Base Project
//
//  Created by Widi Setyawan on 17/01/18.
//  Copyright © 2018 Docotel Group. All rights reserved.
//

import UIKit

public enum AnimationType{
    case push
    case pop
    case present
    case dismiss
}

extension AppDelegate {
    func changeRoot(to newViewController:UIViewController,with animation: AnimationType, duration:CGFloat = 0.33){
        let currentViewController = UIApplication.shared.delegate?.window??.rootViewController
        let width = currentViewController?.view.frame.size.width;
        let height = currentViewController?.view.frame.size.height;
        
        var previousFrame:CGRect?
        var nextFrame:CGRect?
        
        switch animation
        {
        case .push:
            previousFrame = CGRect(x: width!-1, y: 0.0, width: width!, height: height!)
            nextFrame = CGRect(x: -width!, y: 0.0, width: width!, height : height!);
            break
            
        case .pop:
            previousFrame = CGRect(x: -width!+1, y: 0.0, width: width!, height: height!);
            nextFrame = CGRect(x: width!, y: 0.0, width : width!, height : height!);
            break
            
        case .present:
            previousFrame = CGRect(x: 0.0, y: height!-1, width: width!, height: height!);
            nextFrame = CGRect(x: 0.0, y: -height!+1, width: width!, height: height!);
            break
            
        case .dismiss:
            previousFrame = CGRect(x: 0.0, y: -height!+1, width: width!, height: height!);
            nextFrame = CGRect(x: 0.0, y: height!-1, width: width!, height: height!);
            break
        }
        
        newViewController.view.frame = previousFrame!
        self.window?.addSubview(newViewController.view)
        UIView.animate(withDuration: 0.33,
                       animations: { () -> Void in
                        newViewController.view.frame = (currentViewController?.view.frame)!
                        currentViewController?.view.frame = nextFrame!
        })
        { (finish:Bool) -> Void in
            self.window?.rootViewController = newViewController
        }
    }
    
    open class func instance() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
}
