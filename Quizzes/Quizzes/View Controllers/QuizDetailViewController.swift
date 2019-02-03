//
//  QuizDetailViewController.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizDetailViewController: UIViewController {

    let quizDetailView = QuizDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(quizDetailView)
        quizDetailView.myQuizCollectionView.dataSource = self
        quizDetailView.myQuizCollectionView.delegate = self
        quizDetailView.delegate = self

    }
}
extension QuizDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizDetailCollectionViewCell", for: indexPath) as? QuizDetailCollectionViewCell else {return UICollectionViewCell()}
//        cell.cellLabel.text = "Hello"
        return cell
    }
    
    
}
extension QuizDetailViewController: QuizDetailViewDelegate {
    func animation() {
        
//        if cat.image == UIImage(named: "cat") {
//            UIView.transition(with: cat, duration: 1.0, options: [.curveEaseInOut, .transitionFlipFromRight], animations: {
//                self.cat.image = UIImage(named: "dog")
//                self.label.text = "Dog"
//            })
//        } else {
//            UIView.transition(with: cat, duration: 1.0, options: [.curveEaseInOut, .transitionFlipFromRight], animations: {
//                self.cat.image = UIImage(named: "cat")
//                self.label.text = "Cat"
//            })
//        }
    }
    
    
}
