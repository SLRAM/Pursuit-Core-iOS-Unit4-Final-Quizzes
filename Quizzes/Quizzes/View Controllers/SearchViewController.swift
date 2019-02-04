//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
//    private var quizzes = [Quiz]()
    
    private var searchInfo = [SearchModel](){
        didSet {
            DispatchQueue.main.async {
                self.searchView.mySearchCollectionView.reloadData()
//                if let categorySelected = UserDefaults.standard.value(forKey: UserDefaultsKeys.settingsCategoryKey) as? Int {
//                    self.bestSellerView.myBestSellerPickerView.selectRow(categorySelected, inComponent: 0, animated: true)
//                    self.setupBooks(listName: self.bestSellerCategories[categorySelected].listNameEncoded)
//                } else {
//                    print("no category in defaults")
//                }
            }
        }
    }

    private let searchView = SearchView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(searchView)
//        quizzes = QuizModel.getQuizzes()
        setupCells()

        searchView.mySearchCollectionView.dataSource = self
        searchView.mySearchCollectionView.delegate = self
        
    }
    
    private func setupCells(){
        SearchAPIClient.getSearchQuizzes { (appError, quizzes) in
            if let appError = appError {
                print("book categories error: \(appError)")
            } else if let quizzes = quizzes {
                self.searchInfo = quizzes
            }
        }
    }
    
    private func saveQuiz(search: SearchModel)-> Quiz? {
        let quizTitle = search.quizTitle
        let firstFact = search.facts[0]
        let secondFact = search.facts[1]
        let facts = [firstFact,secondFact]
        //********
        let username = "@username"
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        formatter.timeStyle = .medium
        let timestamp = formatter.string(from: date)
        
        let quiz = Quiz.init(facts: facts, quizTitle: quizTitle, username: username, createdAt: timestamp)
        
        return quiz
    }
    private func setQuizMessage(bool: Bool) {
        if bool {
            let alert = UIAlertController(title: "Your Quiz has been saved!", message: nil, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Sorry that quiz exists already!", message: nil, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }



}
extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(searchInfo.count)
        return searchInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let searchCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else {return UICollectionViewCell()}
        let quiz = searchInfo[indexPath.row]
        searchCollectionViewCell.cellLabel.text = quiz.quizTitle
        searchCollectionViewCell.cellButton.tag = indexPath.row
        searchCollectionViewCell.cellButton.addTarget(self, action: #selector(cellButtonPressed), for: .touchUpInside)
//        cell.delegate = self
        return searchCollectionViewCell
    }
    @objc func cellButtonPressed(sender: SearchCollectionViewCell) {
        let search = searchInfo[sender.tag]
        print("+ pressed sender tag: \(sender.tag)")
        print(search.quizTitle)
        if QuizModel.quizAlreadyCreated(newTitle: search.quizTitle, username: "@username") {
            //alert that says quiz already exists
            setQuizMessage(bool: false)
        } else {
            guard let quiz = saveQuiz(search: search) else {
                print("Failed to save quiz")
                return
            }
            QuizModel.appendQuiz(quiz: quiz)
            setQuizMessage(bool: true)

        }

    }

    
    
}
//extension SearchViewController: SearchCollectionViewCellDelegate {
//    func actionAlert() {
//        guard let selectedCell = searchView.mySearchCollectionView.cellForItem(at: 0) as? SearchCollectionViewCell else {return}
//
//        print("Search + button pressed")
//        if QuizModel.quizAlreadyCreated(newTitle: searchView., username: "@username") {
//            //alert that says quiz already exists
//        } else {
//            guard let quiz = saveQuiz() else {
//                print("Failed to save quiz")
//                return
//            }
//            QuizModel.appendQuiz(quiz: quiz)
//
//    }
//    }
//
//}
