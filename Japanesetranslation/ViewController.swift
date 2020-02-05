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
        let text:String = inputText.text!
        translateSentence(inputText:text)
    }
    
    func translateSentence(inputText:String) {
        let url = URL(string: "https://labs.goo.ne.jp/api/hiragana")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST";
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        
        let params: [String: Any] = [
            "app_id":"",
            "request_id":"record003",
            "sentence":inputText,
            "output_type":"hiragana"
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            let task:URLSessionDataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {
                (data,response,error) -> Void in
                let resultData = String(data: data!, encoding: .utf8)!
                print("result:\(resultData)")
//                print("response:\(response)")
            })
            task.resume()
        } catch {
            print("Error:\(error)")
        }
    }
    
//    func load() -> URLSessionDataTask {
//
//    }
}

