//
// Created by Lafran Pane on 1/16/18.
// Copyright (c) 2018 Docotel Group. All rights reserved.
//

import Foundation

open class CurrencyUtil {

    open class func toRpFormat(_ value: Double) -> String? {
        let formatter = rupiahFormatter
        return formatter.string(from: NSNumber(value: value))
    }

    open class func toRpFormat(_ value: Float) -> String? {
        let formatter = rupiahFormatter
        return formatter.string(from: NSNumber(value: value))
    }

    open class func toRpFormat(_ value: Int) -> String? {
        let formatter = rupiahFormatter
        return formatter.string(from: NSNumber(value: value))
    }

    open class func clearRp(_ source: String) -> String {
        let replaced = source.replacingOccurrences(of: "Rp", with: "")
        return replaced
    }

}

public var rupiahFormatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale(identifier: "id")
    return formatter
}
