//
//  TranslationAPIManager.swift
//  Japanesetranslation
//
//  Created by jeong gwanjin on 2020/02/05.
//  Copyright © 2020 jeong gwanjin. All rights reserved.
//

import UIKit

class TranslationAPIManager {
    class func translateToHiragana(inputText:String, success:@escaping (ReceiveData)->Void, failure:()->Void) {
        var result_var:String = ""
        let url = URL(string: "https://labs.goo.ne.jp/api/hiragana")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        
        do {
            request.httpBody = try! JSONEncoder().encode(SendData(sentence: inputText))
            let task:URLSessionDataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {
                (data,response,error) -> Void in
                let result = try! JSONDecoder().decode(ReceiveData.self, from: data!)
                success(result)
            })
            task.resume()
        } catch {
            print("Error:\(error)")
        }
    }
}
