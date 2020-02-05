//
//  SendData.swift
//  Japanesetranslation
//
//  Created by jeong gwanjin on 2020/02/05.
//  Copyright © 2020 jeong gwanjin. All rights reserved.
//

class SendData:Codable {
    let app_id:String = ""
    let sentence:String
    let output_type:String = "hiragana"
    
    
    init(sentence:String) {
        self.sentence = sentence
    }
}
