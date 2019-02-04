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
    var quizTitle: String?
    var facts: [String]?
    var quiz: Quiz?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(quizDetailView)
        quizDetailView.myQuizCollectionView.dataSource = self
        quizDetailView.myQuizCollectionView.delegate = self
    }
}
extension QuizDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let quizFacts = facts else {return 0}
        return quizFacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizDetailCollectionViewCell", for: indexPath) as? QuizDetailCollectionViewCell else {return UICollectionViewCell()}
        cell.cellLabel.text = quizTitle
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? QuizDetailCollectionViewCell
        if cell?.cellLabel.text == quizTitle {
            UIView.transition(with: quizDetailView.myQuizCollectionView.cellForItem(at: indexPath)!, duration: 1.0, options: [.curveEaseInOut, .transitionFlipFromRight], animations: {
                cell?.cellLabel.text = self.facts![indexPath.row]
            })
        } else {
            UIView.transition(with: quizDetailView.myQuizCollectionView.cellForItem(at: indexPath)!, duration: 1.0, options: [.curveEaseInOut, .transitionFlipFromRight], animations: {
                cell?.cellLabel.text = self.quizTitle
            })
        }

    }
    
    
}

