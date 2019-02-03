//
//  QuizDetailViewController.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizDetailViewController: UIViewController {

    private let quizDetailView = QuizDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(quizDetailView)

    }
}
