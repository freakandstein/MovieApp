//
//  BaseResponse.swift
//  MovieApp
//
//  Created by Satrio Wicaksono on 04/03/2019.
//  Copyright © 2019 Docotel Group. All rights reserved.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    var status: String
    var data: Array<T>
    var error: ErrorModel?
}

struct ErrorModel: Codable {
    var title: String
    var detail: String
    var code: String?
}
