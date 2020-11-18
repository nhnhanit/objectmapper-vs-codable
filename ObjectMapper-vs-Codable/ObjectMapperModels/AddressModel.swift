//
//  Address.swift
//  ObjectMapper-vs-Codable
//
//  Created by HongNhan on 11/17/20.
//

import Foundation
import ObjectMapper

class AddressModel: Mappable {
    var street: String?
    var zipcode: String?
    
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        street <- map["street"]
        zipcode <- map["zipcodeForAddress"]
    }
}
