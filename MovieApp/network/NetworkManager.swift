//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Satrio Wicaksono on 03/03/2019.
//  Copyright © 2019 Docotel Group. All rights reserved.
//

import Foundation
import Moya

class NetworkManager<T: BaseApi> {
    
    let ERROR_MESSAGE = "Internal Error"
    var isVerbose: Bool!
    
    init(verbose: Bool = true) { isVerbose = verbose }
    
    func api() -> MoyaProvider<T> {
        let provider = MoyaProvider<T>(plugins: [NetworkLoggerPlugin(verbose: isVerbose)])
        return provider
    }
    
}
