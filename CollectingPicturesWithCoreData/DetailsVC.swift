//
//  DetailsVC.swift
//  CollectingPicturesWithCoreData
//
//  Created by Kinney Kare on 12/16/19.
//  Copyright © 2019 Kinney Kare. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var detailsTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    
    }
    
    

}
