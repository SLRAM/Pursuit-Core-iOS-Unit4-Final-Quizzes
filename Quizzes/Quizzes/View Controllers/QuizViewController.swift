//
//  QuizViewController.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    private let quizView = QuizView()
    private let emptyQuizView = EmptyQuizView()
    var quizzes = [Quiz]() {
        didSet {
            DispatchQueue.main.async {
                self.quizView.myQuizCollectionView.reloadData()
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //if cells count is 0 then load different view
        quizzes = QuizModel.getQuizzes()
        setupQuizView()
        quizView.myQuizCollectionView.dataSource = self
        quizView.myQuizCollectionView.delegate = self
//        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate

        print(DataPersistenceManager.documentsDirectory())

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        quizzes = QuizModel.getQuizzes()
        setupQuizView()
    }
    func setupQuizView() {
        if quizzes.count > 0 {
            self.view.addSubview(quizView)
            quizView.myQuizCollectionView.reloadData()
        } else {
            self.view.addSubview(emptyQuizView)
            emptyQuizView.firstQuizTextView.reloadInputViews()
        }
    }
    
    
    

}
extension QuizViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCollectionViewCell", for: indexPath) as? QuizCollectionViewCell else {return UICollectionViewCell()}
        let quiz = QuizModel.getQuizzes()[indexPath.row]
        cell.cellLabel.text = quiz.quizTitle
        cell.cellButton.tag = indexPath.row
        print("cell tag: \(cell.cellButton.tag)")
        cell.delegate = self
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedCell = quizView.myQuizCollectionView.cellForItem(at: indexPath) as? QuizCollectionViewCell else {return}
        let quiz = QuizModel.getQuizzes()[indexPath.row]
        let detailVC = QuizDetailViewController()
        detailVC.quiz = quiz
//        detailVC.quizTitle = quiz.quizTitle
        detailVC.quizTitle = selectedCell.cellLabel.text
        detailVC.facts = quiz.facts
        //selected cell is info I have available on the cell
        //quiz is info available from the quiz model
        //detailVC is info i want to set on the detail page
        
//        detailVC.detailView.detailFavoritesImage.image = selectedCell.cellImage.image
//        detailVC.detailView.detailLabel.text = book.bookDetails.first?.author


        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}
extension QuizViewController: QuizCollectionViewCellDelegate {
    func actionSheet(tag: Int) {
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let  deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
            print("Tag: \(tag)")
            QuizModel.deleteBook(index: tag)
            self.quizzes = QuizModel.getQuizzes()
            self.setupQuizView()
        })

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    
}
