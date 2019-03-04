//
// Created by Lafran Pane on 1/8/18.
// Copyright (c) 2018 Docotel Group. All rights reserved.
//

import UIKit
import Foundation

@objc protocol BaseDelegate {
    func taskDidBegin()
    func taskDidFinish()
    func taskDidError(message: String)
}


