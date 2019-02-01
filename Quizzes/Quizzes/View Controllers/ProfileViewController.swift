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
        if profileView.profileNameButton.currentTitle == "@username" {
            print("No user!")
        
                let alertController = UIAlertController(title: "Please enter your username", message: "no spaces or special characters", preferredStyle: .alert)
                alertController.addTextField { (textfield) in
                    textfield.placeholder = "@username"
                    textfield.textAlignment = .center
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                let submitAction = UIAlertAction(title: "submit", style: .default) { alert in
                    self.profileView.profileNameButton.setTitle(alertController.textFields?.first?.text, for: .normal)
                    
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
    func profileImage() {
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
    
    func profileName() {
        let alertController = UIAlertController(title: "Please enter your username", message: "no spaces or special characters", preferredStyle: .alert)
        alertController.addTextField { (textfield) in
            textfield.placeholder = "@username"
            textfield.textAlignment = .center
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let submitAction = UIAlertAction(title: "submit", style: .default) { alert in
            
            
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
