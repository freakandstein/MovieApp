//
//  UIViewControllerXt.swift
//  MovieApp
//
//  Created by Satrio Wicaksono on 02/03/2019.
//  Copyright © 2019 Docotel Group. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setEnableViews(enable: Bool, _ views: UIView...) {
        views.forEach({ $0.isUserInteractionEnabled = enable })
    }
    
    func setHiddenViews(hidden: Bool, _ views: UIView...) {
        views.forEach({ $0.isHidden = hidden })
    }
    
    private static let fullscreenActivityIndicatorViewTag = 88
    
    var isNetworkActivityIndicatorVisible: Bool {
        set {
            UIApplication.shared.isNetworkActivityIndicatorVisible = newValue
        }
        get {
            return UIApplication.shared.isNetworkActivityIndicatorVisible
        }
    }
    
    var isFullscreenActivityIndicatorVisible: Bool {
        set {
            var indicatorView = view.viewWithTag(UIViewController.fullscreenActivityIndicatorViewTag) as? UIActivityIndicatorView
            if newValue {
                if indicatorView == nil {
                    indicatorView = UIActivityIndicatorView(style: .whiteLarge)
                    indicatorView?.tag = UIViewController.fullscreenActivityIndicatorViewTag
                }
                indicatorView?.frame = self.view.bounds
                indicatorView?.backgroundColor = UIColor(white: 0, alpha: 0.66)
                indicatorView?.startAnimating()
                indicatorView?.isHidden = false
                self.view.addSubview(indicatorView!)
                self.view.isUserInteractionEnabled = false
            } else {
                if indicatorView != nil {
                    indicatorView?.stopAnimating()
                    indicatorView?.removeFromSuperview()
                }
                self.view.isUserInteractionEnabled = true
            }
        }
        get {
            let indicatorView = view.viewWithTag(UIViewController.fullscreenActivityIndicatorViewTag) as? UIActivityIndicatorView
            return (indicatorView != nil) && !indicatorView!.isHidden
        }
    }
    
}
