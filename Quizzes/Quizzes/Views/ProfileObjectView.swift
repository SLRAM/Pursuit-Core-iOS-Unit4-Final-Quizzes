//
//  ProfileObjectView.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileObjectView: UIView {
    
    lazy var profileImageButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = button.bounds.width/2.0 + 65
        button.clipsToBounds = true
        button.setImage(UIImage(named: "placeholderImage"), for: .normal)
        button.addTarget(self, action: #selector(profileImagePressed), for: .touchUpInside)
        return button
    }()
    @objc func profileImagePressed(_ sender: UIButton) {
        print("Profile image pressed")
        //        delegate?.actionSheet(tag: sender.tag)
    }
    
    lazy var profileNameButton: UIButton = {
        let button = UIButton()
        button.setTitle("@username", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(profileNamePressed), for: .touchUpInside)
        return button
    }()
    @objc func profileNamePressed(_ sender: UIButton) {
        print("Profile name pressed")
//        delegate?.actionSheet(tag: sender.tag)
    }
    
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
extension ProfileObjectView {
    func setupCollectionView() {
        setupImageButton()
        setupNameButton()
    }
    func setupImageButton() {
        addSubview(profileImageButton)
        profileImageButton.translatesAutoresizingMaskIntoConstraints = false
        profileImageButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        profileImageButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.45).isActive = true
        profileImageButton.widthAnchor.constraint(equalTo: profileImageButton.heightAnchor, multiplier: 1.0).isActive = true
        profileImageButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    func setupNameButton() {
        addSubview(profileNameButton)
        profileNameButton.translatesAutoresizingMaskIntoConstraints = false
        profileNameButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        profileNameButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        profileNameButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        profileNameButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    
}

