//
//  StringXt.swift
//  MovieApp
//
//  Created by Satrio Wicaksono on 02/03/2019.
//  Copyright © 2019 Docotel Group. All rights reserved.
//

import Foundation

extension String {
    
    func parseDateTimeToDate() -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let fromDate = dateFormatterGet.date(from: self)
        
        let dateFormatterParse = DateFormatter()
        dateFormatterParse.dateFormat = "yyyy-MM-dd"
        return dateFormatterParse.string(from: fromDate!)
    }
    
    func parseToDate() -> Date{
        let dateFormatterParse = DateFormatter()
        dateFormatterParse.dateFormat = "yyyy-MM-dd"
        return dateFormatterParse.date(from: self)!
    }
}
