//
//  QuizModel.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class QuizModel {
    private static let filename = "SavedQuizList.plist"
    private static var quizzes = [Quiz]()
    private static var filtered = [Quiz]()

    private init() {}
    static func appendQuiz(quiz: Quiz) {
        quizzes.append(quiz)
        quizzes = quizzes.sorted {$0.createdAt > $1.createdAt}
        saveQuiz()
    }
    static func quizAlreadyCreated(newTitle: String, username: String)-> Bool {
        var quizTitle = false
        if quizzes.isEmpty {
            return quizTitle
        } else {
            for num in 0...quizzes.count - 1 {
                if quizzes[num].quizTitle == newTitle && quizzes[num].username == username{
                    quizTitle = true
                }
            }
        }
        return quizTitle
    }

    static func saveQuiz() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)

        do {
            let data = try PropertyListEncoder().encode(quizzes)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoder: \(error)")
        }
    }
    static func deleteBook(index: Int) {
        var number = Int()
        
        for num in 0...quizzes.count-1 {
            if filtered[index].quizTitle == quizzes[num].quizTitle && filtered[index].username == quizzes[num].username {
                number = num
                break
            }
        }
        filtered.remove(at: index)
        quizzes.remove(at: number)
        saveQuiz()
    }

    static func getQuizzes() -> [Quiz] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path

        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    quizzes = try PropertyListDecoder().decode([Quiz].self, from: data)
//                    print("first print of quizzes: \(quizzes)")
                } catch {
                    print("Property list decoding error: \(error)")
                }
            } else {
                print("getPhotoJournal - data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }

        quizzes = quizzes.sorted {$0.createdAt > $1.createdAt}
//        print("second print of quizzes: \(quizzes)")
        filtered = quizzes
        filtered = filtered.filter { $0.username == "@username" }
//        print("third print of quizzes: \(quizzes)")
//        print("fourth print of filtered: \(filtered)")

        return filtered
    }
}

