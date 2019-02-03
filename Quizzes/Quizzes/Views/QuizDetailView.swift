//
//  QuizDetailView.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

protocol QuizDetailViewDelegate: AnyObject {
    func animation()
}

class QuizDetailView: UIView {
    weak var delegate: QuizDetailViewDelegate?

    
    public lazy var myQuizCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //make cells adjust
        let width = (frame.size.width)/2 - 20
        let height = (frame.size.height)/3
        
        layout.itemSize = CGSize.init(width: width, height: height) // cell size
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        
        let cv = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(QuizDetailCollectionViewCell.self, forCellWithReuseIdentifier: "QuizDetailCollectionViewCell")
        cv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return cv
    }()
    public lazy var myQuizCollectionButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    @objc func buttonPressed() {
        delegate?.animation()
        print("quiz clicked!")
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
        setupCollectionViewCell()
    }
    
}
extension QuizDetailView {
    func setupCollectionViewCell() {
        setupCollectionView()
        setupButton()
    }
    func setupCollectionView() {
        addSubview(myQuizCollectionView)
        myQuizCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myQuizCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        myQuizCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        myQuizCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        myQuizCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    func setupButton() {
        addSubview(myQuizCollectionButton)
        myQuizCollectionButton.translatesAutoresizingMaskIntoConstraints = false
        myQuizCollectionButton.topAnchor.constraint(equalTo: myQuizCollectionView.topAnchor).isActive = true
        myQuizCollectionButton.bottomAnchor.constraint(equalTo: myQuizCollectionView.bottomAnchor).isActive = true
        myQuizCollectionButton.leadingAnchor.constraint(equalTo: myQuizCollectionView.leadingAnchor).isActive = true
        myQuizCollectionButton.trailingAnchor.constraint(equalTo: myQuizCollectionView.trailingAnchor).isActive = true
    }
    
}
