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
    private static let userFilename = "SavedUserList.plist"

    private static var quizzes = [Quiz]()
    private static var filtered = [Quiz]()
    private static var users = [User]()

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

    static func getQuizzes(username: String) -> [Quiz] {
        
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path

        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    quizzes = try PropertyListDecoder().decode([Quiz].self, from: data)
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
        filtered = quizzes
        filtered = filtered.filter { $0.username == username }

        return filtered
    }
    
    
    
    static func usernameAlreadyCreated(username: String)-> Bool {
        var profileUsername = false
        if users.isEmpty {
            return profileUsername
        } else {
            for num in 0...users.count - 1 {
                if users[num].username == username{
                    profileUsername = true
                }
            }
        }
        return profileUsername
    }
    
    static func appendUser(user: User) {
        users.append(user)
        saveUser()
    }
    static func editUser(username: String, user: User) {
        for num in 0...users.count - 1 {
            if users[num].username == username {
                users[num] = user
            }
        }
        saveUser()
    }
    
    static func saveUser() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: userFilename)
        
        do {
            let data = try PropertyListEncoder().encode(users)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoder: \(error)")
        }
    }
    static func getUser() -> [User] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: userFilename).path
        
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    users = try PropertyListDecoder().decode([User].self, from: data)
                } catch {
                    print("Property list decoding error: \(error)")
                }
            } else {
                print("getPhotoJournal - data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        
        return users
    }
}

