//
//  ViewController.swift
//  Japanesetranslation
//
//  Created by jeong gwanjin on 2020/01/28.
//  Copyright © 2020 jeong gwanjin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var outputText: UITextField!
    @IBOutlet weak var translateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tabButton(_ sender: UIButton) {
        outputText.text = inputText.text;
    }
}

