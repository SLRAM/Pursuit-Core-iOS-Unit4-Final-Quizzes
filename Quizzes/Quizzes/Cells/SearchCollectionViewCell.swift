//
//  SearchCollectionViewCell.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit
protocol SearchCollectionViewCellDelegate: AnyObject {
    func actionAlert()
}
class SearchCollectionViewCell: UICollectionViewCell {
        weak var delegate: SearchCollectionViewCellDelegate?
    
    public lazy var cellLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    lazy var cellButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addIconFilled"), for: .normal)
                button.addTarget(self, action: #selector(cellButtonPressed), for: .touchUpInside)
        return button
    }()
        @objc func cellButtonPressed(_ sender: UIButton) {
            delegate?.actionAlert()
            print("Search + button pressed")
        }
    
    
    //    override func prepareForReuse() {
    //        self.cellImage.image = nil
    //    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupCells()
    }
}
extension SearchCollectionViewCell {
    func setupCells() {
        setupCellButton()
        setupCellLabel()
    }
    func setupCellButton() {
        addSubview(cellButton)
        cellButton.translatesAutoresizingMaskIntoConstraints = false
        cellButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        cellButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    func setupCellLabel() {
        addSubview(cellLabel)
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        cellLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        cellLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5)
    }
    
}
