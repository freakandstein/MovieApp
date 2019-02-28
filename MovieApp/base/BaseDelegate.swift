//
// Created by Lafran Pane on 1/8/18.
// Copyright (c) 2018 Docotel Group. All rights reserved.
//

import UIKit
import Foundation

@objc protocol BaseDelegate {
    @objc optional func taskDidBegin()
    @objc optional func taskDidFinish()

    func taskDidError(message: String)
}


