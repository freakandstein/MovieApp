//
// Created by Lafran Pane on 1/16/18.
// Copyright (c) 2018 Docotel Group. All rights reserved.
//

import UIKit

extension Optional where Wrapped == Collection {
    var isNilOrEmpty: Bool {
        switch self {
        case let collection?:
            return collection.isEmpty
        case nil:
            return true
        }
    }
}

extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        switch self {
        case let string?:
            return string.isEmpty
        case nil:
            return true
        }
    }
}

extension UIViewController {

    func setEnableViews(enable: Bool, _ views: UIView...) {
        views.forEach({ $0.isUserInteractionEnabled = enable })
    }

    func setHiddenViews(hidden: Bool, _ views: UIView...) {
        views.forEach({ $0.isHidden = hidden })
    }

}
