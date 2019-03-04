//
//  LoginModel.swift
//  MovieApp
//
//  Created by Satrio Wicaksono on 04/03/2019.
//  Copyright © 2019 Docotel Group. All rights reserved.
//

import Foundation

struct LoginModel: Codable {
    var token: String
    var userId: String
    
    enum CodingKeys: String, CodingKey {
        case token
        case userId = "user_id"
    }
}
