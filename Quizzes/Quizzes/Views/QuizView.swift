//
//  QuizView.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizView: UIView {
    
    
    public lazy var myQuizCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let width = (frame.size.width)/2 - 20
        let height = (frame.size.height)/3
        layout.itemSize = CGSize.init(width: width, height: height) // cell size
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        
        let cv = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(QuizCollectionViewCell.self, forCellWithReuseIdentifier: "QuizCollectionViewCell")
        cv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return cv
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
extension QuizView {
    func setupCollectionView() {
        addSubview(myQuizCollectionView)
        myQuizCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myQuizCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        myQuizCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        myQuizCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        myQuizCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
