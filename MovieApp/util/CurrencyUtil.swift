//
// Created by Lafran Pane on 1/24/18.
// Copyright (c) 2018 Docotel. All rights reserved.
//

import Foundation

open class CurrencyUtil {

    open class func toRpFormat(_ value: Double) -> String {
        let amount = rupiahFormatter.string(from: NSNumber(value: value))!
        return addPaddingSpace(from: amount)
    }

    open class func toRpFormat(_ value: Float) -> String {
        let amount = rupiahFormatter.string(from: NSNumber(value: value))!
        return addPaddingSpace(from: amount)
    }

    open class func toRpFormat(_ value: Int) -> String {
        let amount = rupiahFormatter.string(from: NSNumber(value: value))!
        return addPaddingSpace(from: amount)
    }

    open class func clearRp(_ source: String) -> String {
        let replaced = source.replacingOccurrences(of: "Rp", with: "")
        return replaced
    }

    open class func addPaddingSpace(from value: String) -> String {
        var mutableStr = value
        let symbol = rupiahFormatter.currencySymbol!
        mutableStr.insert(" ", at: symbol.index(symbol.startIndex, offsetBy: symbol.count))
        return mutableStr
    }

}

public var rupiahFormatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale(identifier: "in_ID")
    return formatter
}

