//
//  EmptyQuizView.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class EmptyQuizView: UIView {

    lazy var firstQuizTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .gray
        textView.text = "You don't have any quizzes. Create your own or search for some!"
        textView.font = UIFont.boldSystemFont(ofSize: 25)
        textView.textAlignment = .center
        


        return textView
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
        setupFirstQuizTextField()
    }
    
}
extension EmptyQuizView {
    func setupFirstQuizTextField() {
        addSubview(firstQuizTextView)
        firstQuizTextView.translatesAutoresizingMaskIntoConstraints = false
//        firstQuizTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
//        firstQuizTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        firstQuizTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        firstQuizTextView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        firstQuizTextView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        firstQuizTextView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        firstQuizTextView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
    }
}

