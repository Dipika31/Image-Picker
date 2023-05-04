//
//  ViewController.swift
//  Image Picker
//
//  Created by Choudhary Dipika on 17/03/23.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imagePicker: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.layer.borderWidth = 1
        imagePicker.layer.borderColor = UIColor.black.cgColor
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.image = info[.editedImage] as! UIImage
        dismiss(animated: true)
    }
    
    @IBAction func addImageButton(_ sender: UIButton) {
        showAlert()
    }
    
    func showAlert()
    {
        let alert = UIAlertController.init(title: "Add Image", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: "Camera", style: .default))
        alert.addAction(UIAlertAction.init(title: "Gallery", style: .default, handler: { alert in
            
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = .photoLibrary
            image.allowsEditing = true
            self.present(image, animated: true)
        }))
        present(alert, animated: true)
    }
}

