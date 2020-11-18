//
//  AddressModelCo.swift
//  ObjectMapper-vs-Codable
//
//  Created by HongNhan on 11/17/20.
//

class AddressModelCo: Codable {
    var street: String?
    var zipcode: String?
    var city: String?
    
    private enum CodingKeys: String, CodingKey {
        case street
        case zipcode = "zipcodeForAddress"
        case city
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(street, forKey: .street)
        try container.encodeIfPresent(zipcode, forKey: .zipcode)
        try container.encodeIfPresent(city, forKey: .city)
        
        // Not super encode because not inheritance
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.street = try container.decodeIfPresent(String.self, forKey: .street)
        self.zipcode = try container.decodeIfPresent(String.self, forKey: .zipcode)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        
        // Not super init because not inheritance
    }
}
