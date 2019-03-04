//
//  MainViewController.swift
//  MovieApp
//
//  Created by Satrio Wicaksono on 04/03/2019.
//  Copyright © 2019 Docotel Group. All rights reserved.
//

import Foundation
import UIKit
import Moya

class MainViewController: BaseViewController<MainPresenter>, MainDelegate{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenter(view: self)
        presenter.login(username: "tes", password: "tes")
    }
    
    func didLoadSuccess(modelObj: LoginModel) {
        print(modelObj.userId)
    }
    
    func taskDidBegin() {
        isFullscreenActivityIndicatorVisible = true
    }
    
    func taskDidFinish() {
        isFullscreenActivityIndicatorVisible = false
    }
    
    func taskDidError(message: String) {
        showError(title: nil, message: message)
    }
}

