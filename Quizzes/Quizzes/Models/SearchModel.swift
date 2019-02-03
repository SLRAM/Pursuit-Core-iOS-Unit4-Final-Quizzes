//
//  SearchModel.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct SearchModel: Codable {
    let facts: [String]
    let id: String
    let quizTitle: String
}
