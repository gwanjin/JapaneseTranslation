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
        let url = URL(string: "https://labs.goo.ne.jp/api/hiragana")
        var _request = URLRequest(url: url!)
        _request.httpMethod = "POST"
        _request.addValue("application/json", forHTTPHeaderField: "content-type")
        
        do {
            _request.httpBody = try JSONEncoder().encode(SendData(sentence: inputText))
            let task:URLSessionDataTask = URLSession.shared.dataTask(with: _request as URLRequest, completionHandler: {
                (data,response,error) -> Void in
                let httpResponse = response as! HTTPURLResponse
                if ( httpResponse.statusCode == 200 ) {
                    do {
                        let result = try JSONDecoder().decode(ReceiveData.self, from: data!)
                        success(result)
                    } catch {
                        print("Error:\(error)")
                    }
                }
            })
            task.resume()
        } catch {
            print("Error:\(error)")
        }
    }
}
