//
//  ProfileViewController.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {
    //textField action code obtained from https://forums.developer.apple.com/thread/93918
    //textField delegate code obtained from https://stackoverflow.com/questions/28012867/restrict-the-input-of-a-textfield-in-uialertcontroller-when-the-user-types-using
    //user defaults image code obtained from https://stackoverflow.com/questions/48294912/how-to-set-uiimage-array-in-nsuserdefaults-in-swift-4
    
    private var imagePickerViewController: UIImagePickerController!
    private var profileView = ProfileView()
    var user = [User]()
    var alertController : UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileView)
        profileView.delegate = self
        setupImagePickerViewController()
        checkDefaultName()
    }
    private func saveUser()-> User? {
        guard let image = profileView.profileImageButton.currentImage,
        let username = profileView.profileNameButton.titleLabel?.text else {return nil}
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return nil}
        let user = User.init(username: username, profileImage: imageData)
        return user
    }
    private func checkDefaultName() {
        if let username = UserDefaults.standard.value(forKey: UserDefaultsKeys.usernameKey) as? String {
            self.profileView.profileNameButton.setTitle(username, for: .normal)
            let imageData = UserDefaults.standard.object(forKey: UserDefaultsKeys.userImageKey) as? NSData
            if let imageData = imageData as Data?{
                self.profileView.profileImageButton.setImage(UIImage(data: imageData), for: .normal)
            }
        } else {
            print("no username in defaults")
        }
        if profileView.profileNameButton.currentTitle == "@username" {
            profileView.profileImageButton.setImage(UIImage(named: "placeholderImage"), for: .normal)
            profileView.profileImageButton.isEnabled = false
            userRegister()
        }
    }
    @objc func alertTextFieldDidChange(_ sender: UITextField) {
        alertController?.actions[0].isEnabled = sender.text! != "username"
    }
    private func userRegister() {
        alertController = UIAlertController(title: "Please enter your username", message: "no spaces or special characters", preferredStyle: .alert)
        alertController?.addTextField(configurationHandler: { (textField) -> Void in
                textField.placeholder = "username"
                textField.keyboardType = UIKeyboardType.emailAddress
                textField.addTarget(self, action: #selector(self.alertTextFieldDidChange(_:)), for: .editingChanged)
            textField.delegate = self
            })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let submitAction = UIAlertAction(title: "Submit", style: .default, handler: { (action) -> Void in
            let username = "@\(self.alertController?.textFields?.first?.text ?? "@username")"
            self.profileView.profileNameButton.setTitle(username, for: .normal)
            UserDefaults.standard.set(username, forKey: UserDefaultsKeys.usernameKey)
            self.setUserLoginMessage()
            self.profileView.profileImageButton.isEnabled = true
        })
        submitAction.isEnabled = false
        alertController?.addAction(submitAction)
        alertController?.addAction(cancelAction)
        present(alertController!, animated: true)
    }
    private func setUserLoginMessage() {
        guard let username = profileView.profileNameButton.titleLabel?.text else {return}
        if QuizModel.usernameAlreadyCreated(username: username) {
            let alert = UIAlertController(title: "\(username), Welcome back!", message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            guard let user = saveUser() else {return}
            QuizModel.appendUser(user: user)
            let alert = UIAlertController(title: "\(username), Thank you for logging in!", message: nil, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
}
    private func showImagePickerViewController() {
        present(imagePickerViewController, animated: true, completion: nil)
    }
    private func setupImagePickerViewController() {
        imagePickerViewController =  UIImagePickerController()
        imagePickerViewController.delegate = self
//        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
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
        let cameraAction = UIAlertAction(title: "Take a photo", style: .default, handler: { (action) -> Void in
            self.imagePickerViewController.sourceType = .camera
            self.showImagePickerViewController()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        optionMenu.addAction(libraryAction)
        optionMenu.addAction(cameraAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
        guard let user = saveUser() else {return}
        QuizModel.appendUser(user: user)
    }
    func profileNamePressed() {
        userRegister()
        setUserLoginMessage()
        user = QuizModel.getUser()
        guard let username = profileView.profileNameButton.titleLabel?.text else {return}
        var image = Data()
        for num in 0...user.count-1 {
            if user[num].username == username {
                image = user[num].profileImage
                break
            }
        }
        profileView.profileImageButton.setImage(UIImage(data: image), for: .normal)
    }
}
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.profileView.profileImageButton.setImage(image, for: .normal)
            guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
            UserDefaults.standard.set(imageData, forKey: UserDefaultsKeys.userImageKey)
        } else {
            print("original image is nil")
        }
        dismiss(animated: true, completion: nil)
    }
}
extension ProfileViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let  char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        if (isBackSpace == -92) {
            return true
        }
        let characterSetAllowed = CharacterSet.alphanumerics
        return (string.rangeOfCharacter(from: characterSetAllowed, options: .caseInsensitive) != nil)
    }
}
