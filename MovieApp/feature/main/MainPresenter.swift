//
//  MainPresenter.swift
//  MovieApp
//
//  Created by Satrio Wicaksono on 04/03/2019.
//  Copyright © 2019 Docotel Group. All rights reserved.
//

import Foundation

class MainPresenter: BasePresenter<MainDelegate> {
    
    let provider = NetworkManager<MainApi>(verbose: true)
    
    func login(username: String, password: String){
        view.taskDidBegin()
        provider.api().request(.loginSuccess()) { result in
            switch result{
            case .success(let response):
                let obj = ResponseParser.shared.parse(to: LoginModel.self, from: response)
                if obj != nil {
                    if obj?.error != nil {
                        self.view.taskDidError(message: (obj?.error?.detail)!)
                    } else {
                        self.view.didLoadSuccess(modelObj: (obj?.data.first)!)
                    }
                } else {
                    self.view.taskDidError(message: self.provider.ERROR_MESSAGE)
                }
            case .failure(let err):
                self.view.taskDidError(message: err.errorDescription ?? self.provider.ERROR_MESSAGE)
            }
            self.view.taskDidFinish()
        }
    }
}

protocol MainDelegate: BaseDelegate{
    func didLoadSuccess(modelObj: LoginModel)
}

extension MainDelegate {
    func didLoadSuccess(modelObj: LoginModel){
        
    }
}
