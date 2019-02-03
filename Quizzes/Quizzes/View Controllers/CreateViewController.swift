//
//  CreateViewController.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    private let createView = CreateView()
    var quiz: Quiz?

    
    let titlePlaceholder = "Enter the quiz title"
    let firstPlaceholder = "Enter first quiz fact"
    let secondPlaceholder = "Enter second quiz fact"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(createView)
//        var createViewController = self.storyboard!.instantiateViewControllerWithIdentifier("CreateViewController") as CreateViewController
        createView.titleTextView.delegate = self
        createView.firstQuizTextView.delegate = self
        createView.secondQuizTextView.delegate = self
        createView.delegate = self
        navigationItem.rightBarButtonItem = createView.createButton
    }

    private func saveQuiz()-> Quiz? {
        guard let quizTitle = createView.titleTextView.text,
            let firstFact = createView.firstQuizTextView.text,
            let secondFact = createView.secondQuizTextView.text else {return nil}
        let facts = [firstFact,secondFact]
        //********
        let username = "@user"

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
            let alert = UIAlertController(title: "Your Quiz has been saved!", message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Sorry that quiz exists already!", message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
extension CreateViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        switch textView.tag {
        case 0:
            createView.titleTextView.becomeFirstResponder()
            if createView.titleTextView.text == titlePlaceholder {
                createView.titleTextView.text = ""
                createView.titleTextView.textColor = .black
            }
        case 1:
            createView.firstQuizTextView.becomeFirstResponder()
            if createView.firstQuizTextView.text == firstPlaceholder {
                createView.firstQuizTextView.text = ""
                createView.firstQuizTextView.textColor = .black
            }
        case 2:
            createView.secondQuizTextView.becomeFirstResponder()
            if createView.secondQuizTextView.text == secondPlaceholder {
                createView.secondQuizTextView.text = ""
                createView.secondQuizTextView.textColor = .black
            }
        default:
            print("error selecting create text views")
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        switch textView.tag {
        case 0:
            createView.titleTextView.resignFirstResponder()
        case 1:
            createView.titleTextView.resignFirstResponder()
        case 2:
            createView.titleTextView.resignFirstResponder()
        default:
            print("error leaving create text views")
        }
    }
}
extension CreateViewController: CreateViewDelegate {
    func createPressed() {
        //********
        if QuizModel.quizAlreadyCreated(newTitle: createView.titleTextView.text, username: "@username") {
            setQuizMessage(bool: false)
            //alert that says quiz already exists
        } else {
            guard let quiz = saveQuiz() else {
                print("Failed to save quiz")
                return
            }
            QuizModel.appendQuiz(quiz: quiz)
            setQuizMessage(bool: true)
            createView.titleTextView.text = titlePlaceholder
            createView.firstQuizTextView.text = firstPlaceholder
            createView.secondQuizTextView.text = secondPlaceholder
            createView.resignFirstResponder()
            //reset views
        }
    }
    
    
}
