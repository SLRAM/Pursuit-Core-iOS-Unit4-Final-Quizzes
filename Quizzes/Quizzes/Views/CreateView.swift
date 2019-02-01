//
//  CreateView.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateView: UIView {
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10.0
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = #colorLiteral(red: 0.8529050946, green: 0.8478356004, blue: 0.8568023443, alpha: 0.4653253425).cgColor
        textField.placeholder = "Enter the quiz title"


        return textField
    }()
    lazy var firstQuizTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textField.textColor = .gray
        textField.placeholder = "Enter first quiz fact"

        
        return textField
    }()
    lazy var secondQuizTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textField.textColor = .gray
        textField.placeholder = "Enter second quiz fact"
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        backgroundColor = .white
        setupCollectionView()
    }
    
}
extension CreateView {
    func setupCollectionView() {
        setupTitleTextField()
        setupFirstQuizTextField()
        setupSecondTextField()
    }
    func setupTitleTextField() {
        addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        titleTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.07).isActive = true
    }
    func setupFirstQuizTextField() {
        addSubview(firstQuizTextField)
        firstQuizTextField.translatesAutoresizingMaskIntoConstraints = false
        firstQuizTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 10).isActive = true
        firstQuizTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        firstQuizTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        firstQuizTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.20).isActive = true
    }
    func setupSecondTextField() {
        addSubview(secondQuizTextField)
        secondQuizTextField.translatesAutoresizingMaskIntoConstraints = false
        secondQuizTextField.topAnchor.constraint(equalTo: firstQuizTextField.bottomAnchor, constant: 10).isActive = true
        secondQuizTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        secondQuizTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        secondQuizTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.20).isActive = true
    }
}
