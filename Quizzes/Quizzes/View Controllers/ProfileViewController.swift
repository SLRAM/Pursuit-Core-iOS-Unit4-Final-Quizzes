//
//  ProfileViewController.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    private var profileView = ProfileView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileView)

    }


}
