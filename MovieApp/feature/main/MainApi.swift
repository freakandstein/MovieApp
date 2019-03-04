//
//  MainApi.swift
//  MovieApp
//
//  Created by Satrio Wicaksono on 04/03/2019.
//  Copyright © 2019 Docotel Group. All rights reserved.
//

import Foundation
import Moya

enum MainApi{
    // MARK: List of API
    case loginSuccess()
    case loginFailure()
}

extension MainApi : BaseApi {
    
    var path: String {
        switch self {
        case .loginSuccess:
            return "login-success"
        case .loginFailure:
            return "login-failure"
        }
    }

    var method: Moya.Method {
        switch self {
        case .loginSuccess, .loginFailure:
            return .post
        }
    }

    var parameters: [String: Any] {
        return [:]
    }

    var task: Task {
        switch self {
        case .loginSuccess, .loginFailure:
            return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        }
    }
}
