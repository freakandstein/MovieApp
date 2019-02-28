//
//  BaseViewController.swift
//  iOS Base Project
//
//  Created by Lafran Pane on 1/12/18.
//  Copyright © 2018 Docotel Group. All rights reserved.
//

import UIKit

protocol ApplicationStateDelegate {
    func appWillForeground()
    func appWillBackground()
}

class BaseViewController<T:PresenterCommonDelegate>: UIViewController {
    var presenter: T!
    var stateDelegate: ApplicationStateDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //
    // by default, this will register an observer to listen foreground/background state
    //
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        registerAppDelegateObserver()
    }

    //
    // by default, this will remove an observer to listen foreground/background state
    //
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeAppDelegateObserver()
    }

    //
    // register observer like appDelegate, but only notify if app in foreground/background
    //
    private func registerAppDelegateObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground(_:)), name: Notification.Name.UIApplicationWillEnterForeground, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterBackground(_:)), name: Notification.Name.UIApplicationWillResignActive, object: nil)
    }

    //
    // remove observer appDelegate
    //
    private func removeAppDelegateObserver() {
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIApplicationWillEnterForeground, object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIApplicationWillResignActive, object: nil)
    }

    @objc private func appWillEnterForeground(_ notification: Notification) {
        stateDelegate?.appWillForeground()
    }

    @objc private func appWillEnterBackground(_ notification: Notification) {
        stateDelegate?.appWillBackground()
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

