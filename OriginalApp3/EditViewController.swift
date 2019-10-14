//
//  EditViewController.swift
//  OriginalApp3
//
//  Created by Yuto Wakabayashi on 2019/10/12.
//  Copyright © 2019 com.litech. All rights reserved.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate {
    
    
    @IBOutlet weak var nameTextFeild: UITextField!
    var testText:String = "default"
    //②UserDefaults のインスタンス
    let userDefaults = UserDefaults.standard
    
    
    
    @IBOutlet weak var nicknameTextFeild: UITextField!
    
    @IBOutlet weak var affilicationtextField: UITextField!
    
    @IBOutlet weak var SNSTextField: UITextField!
    var scrollView1 = UIScrollView()
    
    @IBOutlet weak var anotherTextField: UITextField!
    var scrollView2 = UIScrollView()
    
    
    @IBOutlet var cameraImageView: UIImageView!
  

    
    
    func imagePickerController(_ picker: UIImagePickerController ,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        cameraImageView.image = info[.editedImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func launchcamera() {
        let ipc = UIImagePickerController()
        ipc.delegate = self
        ipc.sourceType = UIImagePickerController.SourceType.photoLibrary
        //編集を可能にする
        ipc.allowsEditing = true
        self.present(ipc,animated: true, completion: nil)
        
    }
    func ImagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //編集機能??
        if info[.originalImage] != nil {
            let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
            //画像を設定する
            cameraImageView.image = image
        }
        dismiss(animated: true,completion: nil)
        
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameTextFeild.delegate = self
        nicknameTextFeild.delegate = self
        affilicationtextField.delegate = self
        SNSTextField.delegate = self
        anotherTextField.delegate = self
    }
    
}
// Returnでキーボードを閉じる
extension EditViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ nameTextField: UITextField) -> Bool {
        
        nameTextField.resignFirstResponder()
        // キーボードを閉じるよ！！
        return true
    }
    
}
