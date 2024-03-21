//
//  ViewController.swift
//  TextField
//
//  Created by CaliaPark on 3/20/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
    }
    
}

