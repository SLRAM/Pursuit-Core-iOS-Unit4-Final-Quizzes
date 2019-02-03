//
//  ProfileViewController.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var imagePickerViewController: UIImagePickerController!

    private var profileView = ProfileView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileView)
        profileView.delegate = self
        setupImagePickerViewController()
        checkDefaultName()
        

    }
    private func checkDefaultName() {
        if profileView.profileNameButton.currentTitle == "@username" {
            profileView.profileImageButton.isEnabled = false
            userRegister()
        }

    }
    private func userRegister() {
        //guard agsinst @username and special characters
        let alertController = UIAlertController(title: "Please enter your username", message: "no spaces or special characters", preferredStyle: .alert)
        alertController.addTextField { (textfield) in
            textfield.placeholder = "@username"
            textfield.textAlignment = .center
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let submitAction = UIAlertAction(title: "submit", style: .default) { alert in
            let username = "@\(alertController.textFields?.first?.text ?? "@username")"
            self.profileView.profileNameButton.setTitle(username, for: .normal)
            UserDefaults.standard.set(username, forKey: UserDefaultsKeys.usernameKey)
            self.setUserLoginMessage()
            self.profileView.profileImageButton.isEnabled = true

            //3. add new default search to user defaults
            //user defaults is a key/value pair structure similar to a dictionary
            //keys refer to the saved value
            //STORE / SAVE / PERSIST TO USER DEFAULTS
            //can only save property list objects, ex. Data, String, Bool, Int
            //            UserDefaults.standard.set(defaultSearch, forKey: UserDefaultsKeys.defaultSearchKey)
            
            //TODO: query to Ticketmaster API for event searches
            
            
        }
        alertController.addAction(submitAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)

        
    }
    private func setUserLoginMessage() {
        //if user is new or in memory
        //new user:
        let alert = UIAlertController(title: "Thank you for logging in!", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        //returning user/saved in memory
//        let alert = UIAlertController(title: "Welcome back!", message: "", preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    private func showImagePickerViewController() {
        present(imagePickerViewController, animated: true, completion: nil)
    }
    private func setupImagePickerViewController() {
        imagePickerViewController =  UIImagePickerController()
        imagePickerViewController.delegate = self
//        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
//            cameraButton.isEnabled = false
//        }
    }


}
extension ProfileViewController: ProfileViewDelegate {
    func profileImagePressed() {
        let optionMenu = UIAlertController(title: nil, message: "Options:", preferredStyle: .actionSheet)
        let libraryAction = UIAlertAction(title: "Go to library", style: .default, handler: { (action) -> Void in
            self.imagePickerViewController.sourceType = .photoLibrary
            self.showImagePickerViewController()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        optionMenu.addAction(libraryAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    
    
    
    
    func profileNamePressed() {
        userRegister()
        setUserLoginMessage()
        
    }
    
    
    
    
    
    
    
    
}
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.profileView.profileImageButton.setImage(image, for: .normal)
        } else {
            print("original image is nil")
        }
        dismiss(animated: true, completion: nil)
    }
}
