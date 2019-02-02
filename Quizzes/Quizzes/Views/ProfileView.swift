//
//  ProfileView.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

protocol ProfileViewDelegate: AnyObject {
    func profileImagePressed()
    func profileNamePressed()
}

class ProfileView: UIView {
    
    weak var delegate: ProfileViewDelegate?
    
    private let profileObjectView = UIView()
    lazy var editLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Edit Profile"
        
        
        return label
    }()
    lazy var profileImageButton: UIButton = {
        let button = UIButton()
        //Currently does not adjust!!!!!!
        button.layer.cornerRadius = button.bounds.width/2.0 + 65
        button.clipsToBounds = true
        button.setImage(UIImage(named: "placeholderImage"), for: .normal)
        button.addTarget(self, action: #selector(profileImagePressed), for: .touchUpInside)
        return button
    }()
    @objc func profileImagePressed(_ sender: UIButton) {
        print("Profile image pressed")
        delegate?.profileImagePressed()
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
        delegate?.profileNamePressed()
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
        backgroundColor = #colorLiteral(red: 0.928835094, green: 0.9233136773, blue: 0.9330795407, alpha: 1)
        setupCollectionView()
        
    }
    
}
extension ProfileView {
    func setupCollectionView() {
        setupEditLabel()
        setupProfileObjectView()
        setupImageButton()
        setupNameButton()
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
        profileObjectView.backgroundColor = .white
    }
    func setupImageButton() {
        addSubview(profileImageButton)
        profileImageButton.translatesAutoresizingMaskIntoConstraints = false
        profileImageButton.topAnchor.constraint(equalTo: profileObjectView.topAnchor, constant: 30).isActive = true
        profileImageButton.heightAnchor.constraint(equalTo: profileObjectView.heightAnchor, multiplier: 0.45).isActive = true
        profileImageButton.widthAnchor.constraint(equalTo: profileImageButton.heightAnchor, multiplier: 1.0).isActive = true
        profileImageButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    func setupNameButton() {
        addSubview(profileNameButton)
        profileNameButton.translatesAutoresizingMaskIntoConstraints = false
        profileNameButton.bottomAnchor.constraint(equalTo: profileObjectView.bottomAnchor, constant: -30).isActive = true
        profileNameButton.leadingAnchor.constraint(equalTo: profileObjectView.leadingAnchor, constant: 50).isActive = true
        profileNameButton.trailingAnchor.constraint(equalTo: profileObjectView.trailingAnchor, constant: -50).isActive = true
        profileNameButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
