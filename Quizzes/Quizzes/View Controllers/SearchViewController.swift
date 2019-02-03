//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
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

}
extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(searchInfo.count)
        return searchInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else {return UICollectionViewCell()}
        let quiz = searchInfo[indexPath.row]
        cell.cellLabel.text = quiz.quizTitle
        return cell
    }
    
    
}
