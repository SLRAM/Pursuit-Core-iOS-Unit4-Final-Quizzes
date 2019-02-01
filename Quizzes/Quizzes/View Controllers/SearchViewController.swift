//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    private let searchView = SearchView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(searchView)
        searchView.mySearchCollectionView.dataSource = self
        searchView.mySearchCollectionView.delegate = self
    }

}
extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
    
}
