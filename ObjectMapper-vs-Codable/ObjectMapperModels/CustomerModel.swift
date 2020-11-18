//
//  Customer.swift
//  ObjectMapper-vs-Codable
//
//  Created by HongNhan on 11/17/20.
//

import Foundation
import ObjectMapper

class CustomerModel: BaseModel {
    
    //var id: String? //(On BaseModel)
    var name: String?
    var address: AddressModel?
    var company: CompanyModel?
    
    
    required init?(map: Map) { super.init(map: map) }
        
    override func mapping(map: Map) {
        super.mapping(map: map)

        //id <- map["id"]
        name <- map["name"]
        company <- map["company"]
        address <- map["address"]
    }
}
