//
//  ViewController.swift
//  takePhoto
//
//  Created by Anita on 2017-03-30.
//  Copyright © 2017 Anita. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    let picker = UIImagePickerController()
    
    //Add comments to this project
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }
    
    @IBOutlet weak var displayImageView: UIImageView!
    

    @IBAction func takeSelfieBtn(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.allowsEditing = true
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            present(picker, animated: true, completion: nil)
        }
        else {
            ifCameraUnavailable()
        }
    }
    
    func ifCameraUnavailable() {
        
        let displayAlert = UIAlertController ( title: "Camera Unavilable", message: "Sorry, no device camera", preferredStyle: .alert)
        let clickOkay = UIAlertAction ( title: "OK", style: .default, handler: nil)
        
        displayAlert.addAction(clickOkay)
        present( displayAlert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            var chosenImage = UIImage()
            
            displayImageView.image = selectImage
            displayImageView.contentMode = .scaleAspectFit
            displayImageView.image = chosenImage
            dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }


}

