//
//  Quiz.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
struct Quiz: Codable {
    let facts: [String]
    let quizTitle: String
    let username: String
    let createdAt: String
}
