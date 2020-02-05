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
    @IBOutlet weak var outputText: UILabel!
    @IBOutlet weak var translateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.outputText.layer.borderWidth = 0.5
        self.outputText.layer.borderColor = UIColor.black.cgColor;
        self.translateButton.layer.borderWidth = 0.5
        self.translateButton.layer.borderColor = UIColor.black.cgColor;
    }
    
    @IBAction func tabButton(_ sender: UIButton) {
        TranslationAPIManager.translateToHiragana(inputText: inputText.text!, success: { receiveData in
            DispatchQueue.main.async {
                self.outputText.text = receiveData.converted.trimmingCharacters(in: .whitespacesAndNewlines)
            }
        }, failure: {
            
        })
    }
}

