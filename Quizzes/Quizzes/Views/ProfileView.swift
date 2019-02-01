//
//  ProfileView.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    private let profileObjectView = ProfileObjectView()
    lazy var editLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Edit Profile"
        
        
        return label
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
        backgroundColor = #colorLiteral(red: 0.928835094, green: 0.9233136773, blue: 0.9330795407, alpha: 1)
        setupCollectionView()
        
    }
    
}
extension ProfileView {
    func setupCollectionView() {
        setupEditLabel()
        setupProfileObjectView()
    }
    func setupEditLabel() {
        addSubview(editLabel)
        editLabel.translatesAutoresizingMaskIntoConstraints = false
        editLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        editLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        editLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        editLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.07).isActive = true
    }

    func setupProfileObjectView() {
        addSubview(profileObjectView)
        profileObjectView.translatesAutoresizingMaskIntoConstraints = false
        profileObjectView.topAnchor.constraint(equalTo: editLabel.bottomAnchor, constant: 10).isActive = true
        profileObjectView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        profileObjectView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        profileObjectView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.40).isActive = true
    }
}
