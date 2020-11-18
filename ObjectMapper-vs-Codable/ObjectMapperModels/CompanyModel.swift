//
//  Company.swift
//  ObjectMapper-vs-Codable
//
//  Created by HongNhan on 11/17/20.
//

import Foundation
import ObjectMapper

class CompanyModel: Mappable {
    var name: String?
    
        
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
}
