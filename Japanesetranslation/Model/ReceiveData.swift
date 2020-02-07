//
//  ReceiveData.swift
//  Japanesetranslation
//
//  Created by jeong gwanjin on 2020/02/05.
//  Copyright © 2020 jeong gwanjin. All rights reserved.
//

class ReceiveData:Codable {
    let converted:String
    let output_type:String
    let request_id:String
    
    init(converted:String, output_type:String, request_id:String) {
        self.converted = converted
        self.output_type = output_type
        self.request_id = request_id
    }
}
