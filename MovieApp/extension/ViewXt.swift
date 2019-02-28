//
//  ViewExt.swift
//  Test Doang
//
//  Created by Lafran Pane on 9/15/17.
//  Copyright © 2017 Spoonart. All rights reserved.
//

import UIKit

extension UIView {
    
    open class func fromNib<T : UIView>(nibNameOrNil: String? = nil) -> T? {
        var view: T?
        let name: String
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            // Most nibs are demangled by practice, if not, just declare string explicitly
            name = ""
        }
        let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        for v in nibViews! {
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }
    
    func toRound(radius:CGFloat = 4.0){
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
    
    func removeView(){
        self.fadeOut(completion: { (complete) in
            self.removeFromSuperview()
        })
    }
    
    func fadeIn(completion: ((Bool) -> Swift.Void)? = nil){
        self.alpha = 0.0
        UIView.animate(withDuration: 0.35, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(completion: ((Bool) -> Swift.Void)? = nil){
        self.alpha = 1.0
        UIView.animate(withDuration: 0.35, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
    
    func rotateAnyView(view: UIView, fromValue: Double, toValue: Float, duration: Double = 1) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.duration = duration
        animation.fromValue = fromValue
        animation.toValue = toValue
        view.layer.add(animation, forKey: nil)
    }
    
    func gone(){
        self.isHidden = true
        self.frame = CGRect.zero
        
        if let parent = self.superview{
            parent.layoutIfNeeded()
        }
    }
}
