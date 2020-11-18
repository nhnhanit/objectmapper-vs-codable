//
//  BaseModel.swift
//  ObjectMapper-vs-Codable
//
//  Created by HongNhan on 11/18/20.
//

import Foundation
import ObjectMapper

class BaseModel: Mappable {
    var id: String?
    
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
    }
}
