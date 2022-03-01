//
//  ChnageProfileImg.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 07.02.22.
//

import UIKit

class ChnageProfileImg: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var chooseImg: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var profile: ProfileVC!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(gesture:)))
        chooseImg.addGestureRecognizer(tapGesture)
        chooseImg.isUserInteractionEnabled = true
        
    }
   
    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = true
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }

    @IBAction func updateProfileBtn(_ sender: Any){
        NotificationCenter.default.post(name: Notification.Name("text"), object: (nameTextField.text! + lastNameTextField.text!))

//        NotificationCenter.default.post(name: Notification.Name("s"),object: chooseImg.image)

    }
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")]  as? UIImage{
            chooseImg.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
