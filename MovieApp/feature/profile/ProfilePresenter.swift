//
//  ProfileDelegate.swift
//  MovieApp
//
//  Created by Satrio Wicaksono on 04/03/2019.
//  Copyright © 2019 Docotel Group. All rights reserved.
//

import Foundation

class ProfilePresenter: BasePresenter<ProfileDelegate> {
    
}

protocol ProfileDelegate: BaseDelegate {
    func didSuccessLoad()
}

extension ProfileDelegate {
    func didSuccessLoad() {}
}
