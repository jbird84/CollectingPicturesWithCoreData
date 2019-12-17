//
//  DetailsVC.swift
//  CollectingPicturesWithCoreData
//
//  Created by Kinney Kare on 12/16/19.
//  Copyright © 2019 Kinney Kare. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var detailsTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true
        let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapGesture)
    }
    
    
    
    
    //This allows up to reach the photoLibrary in our phone when UIImageView is tapped on
    @objc func selectImage() {
        
        //First we need to set a constant for the ImagePickerController
        let picker = UIImagePickerController()
        
        //Now we need to make the picker a delegate, then set the source type, lastly set allowsEditing to true.
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        
        //now we need to present the picker
        present(picker, animated: true, completion: nil)
    }
    
    
    
    //this will be the image you selected from the selectImage function.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    
    }
    
    

}
