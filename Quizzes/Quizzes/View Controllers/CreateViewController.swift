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
//        createView.titleTextField.delegate = self
//        createView.firstQuizTextField.delegate = self
//        createView.secondQuizTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
