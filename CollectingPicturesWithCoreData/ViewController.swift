//
//  ViewController.swift
//  CollectingPicturesWithCoreData
//
//  Created by Kinney Kare on 12/16/19.
//  Copyright © 2019 Kinney Kare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        
    }

    @objc func addButtonTapped() {
        
        performSegue(withIdentifier: "savedetails", sender: self)
        
    }

}

