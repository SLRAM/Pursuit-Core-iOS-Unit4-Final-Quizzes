//
//  QuizDetailCollectionViewCell.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizDetailCollectionViewCell: UICollectionViewCell {
    
    public lazy var cellLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
//    lazy var cellButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Title", for: .normal)
//        button.addTarget(self, action: #selector(cellButtonPressed), for: .touchUpInside)
//        return button
//    }()
//    @objc func cellButtonPressed(_ sender: UIButton) {
//        delegate?.actionSheet(tag: sender.tag)
//        print("quiz ... button pressed")
//    }
    
    
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
extension QuizDetailCollectionViewCell {
    func setupCells() {
        setupCellLabel()
    }

    func setupCellLabel() {
        addSubview(cellLabel)
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        cellLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        cellLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        cellLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
    }
    
}
