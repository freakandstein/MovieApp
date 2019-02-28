//
//  BasePresenter.swift
//  Movie App
//
//  Created by Lafran Pane on 1/12/18.
//  Copyright © 2018 Docotel Group. All rights reserved.
//

import Foundation

protocol PresenterCommonDelegate {
    func getDeviceId() -> String?
    func isNetworkAvailable() -> Bool
}

class BasePresenter<T>: PresenterCommonDelegate {
    
    var view: T!

    init(view: T!) {
        self.view = view!
    }

    func isNetworkAvailable() -> Bool {
        return false
    }

    func getDeviceId() -> String? {
        return nil
    }
    
}
