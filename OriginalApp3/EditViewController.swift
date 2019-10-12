//
//  EditViewController.swift
//  OriginalApp3
//
//  Created by Yuto Wakabayashi on 2019/10/12.
//  Copyright © 2019 com.litech. All rights reserved.
//

import UIKit

    class EditViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        
        @IBOutlet weak var nameTextFeild: UITextField!
        
        @IBOutlet weak var nicknameTextFeild: UITextField!
        
        @IBOutlet weak var affilicationtextField: UITextField!
        
        @IBOutlet weak var SNSTextField: UITextField!
        
        @IBOutlet weak var anotherTextField: UITextField!
        
        
        @IBOutlet var cameraImageView: UIImageView!
        
        var originalImage : UIImage!
        
        func imagePickerController(_ picker: UIImagePickerController ,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            cameraImageView.image = info[.editedImage] as? UIImage
            dismiss(animated: true, completion: nil)
        }
        
        
        @IBAction func launchcamera() {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.delegate = self
                
                picker.allowsEditing = true
                
                present(picker, animated: true, completion: nil)
            }
            
         
        }
        
        
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.

            
        }
}

// Returnでキーボードを閉じる
extension EditViewController: UITextFieldDelegate {

    func nameTextFieldShouldReturn(_ nameTextField: UITextField) -> Bool {

        return true
    }
}
