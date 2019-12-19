//
//  DetailsVC.swift
//  CollectingPicturesWithCoreData
//
//  Created by Kinney Kare on 12/16/19.
//  Copyright © 2019 Kinney Kare. All rights reserved.
//

import UIKit
import CoreData

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
        
        //To store in Core Data First Create a appDelegate and context constants
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //Next create a cconstant that points to your Entity you created (in this case it is called Photos)
        let newPicture = NSEntityDescription.insertNewObject(forEntityName: "Photos", into: context)
        
        //Attributes - here we will set values
        newPicture.setValue(itemTextField.text, forKey: "item")
        newPicture.setValue(detailsTextView.text, forKey: "details")
        newPicture.setValue(UUID(), forKey: "id")
        //Saving year will need to be converted since year is an Int and not a String
        if let year = Int(yearTextField.text!) {
            newPicture.setValue(year, forKey: "year")
        }
        
        //to set the picture save it as DATA first
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        newPicture.setValue(data, forKey: "image")
        
        
        //Now perform a Do Catch and save the context (you must do this because it can THROW an error)
        
        do {
            try context.save()
            print("Success")
        }catch {
            print("error")
        }
    
    }
    
    

}
