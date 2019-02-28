//
//  BaseViewController.swift
//  Movie App
//
//  Created by Satrio Wicaksono on 1/3/18.
//  Copyright © 2018 Docotel Group. All rights reserved.
//

import UIKit

class BaseViewController<T:PresenterCommonDelegate>: UIViewController {
    var presenter: T!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    //
    // set title for navigation item
    //
    func setTitle(_ label: String) {
        self.navigationItem.title = label
    }

    //
    // showing alert dialog, with default text button
    //
    func showError(title: String?, message: String, positiveText: String = "OK", handler: ((UIAlertAction) -> Void)? = nil) {
        let actionPositive = UIAlertAction(title: positiveText, style: .default, handler: handler)
        let actionController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        actionController.addAction(actionPositive)
        actionController.present(self, animated: true)
    }

    func showConfirmationDialog(title: String?, message: String, buttons: [String], handlers: [((UIAlertAction) -> Void)?]) {
        let actionNegative = UIAlertAction(title: buttons[0], style: .cancel, handler: handlers[0])
        let actionPositive = UIAlertAction(title: buttons[1], style: .default, handler: handlers[1])
        let actionController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        actionController.addAction(actionPositive)
        actionController.addAction(actionNegative)
        actionController.present(self, animated: true)
    }

    //
    // dismiss the showing keyboard
    //
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}


/* *
 * MARK: Sample Usage


protocol SampleDelegate : BaseDelegate{
    func didLoggedIn()
}

class SamplePresenter: BasePresenter<SampleDelegate> {

}

class LoginViewController: BaseViewController<SamplePresenter>, SampleDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SamplePresenter(view: self)
    }

    func didLoggedIn() {

    }
}
*/

