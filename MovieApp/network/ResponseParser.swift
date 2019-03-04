//
//  ResponseParser.swift
//  MovieApp
//
//  Created by Satrio Wicaksono on 04/03/2019.
//  Copyright © 2019 Docotel Group. All rights reserved.
//

import Foundation
import Moya

class ResponseParser {
    
    static let shared = ResponseParser()
    
    let decoder = JSONDecoder()
    
    func parse<ResponseType: Codable>(to: ResponseType.Type, from response: Moya.Response) -> BaseResponse<ResponseType>? {
        do {
            let response = try decoder.decode(BaseResponse<ResponseType>.self, from: response.data)
            return response
        }catch(let error) {
            print(error.localizedDescription)
            return nil
        }
        return nil
    }
}
