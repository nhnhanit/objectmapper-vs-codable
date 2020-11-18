//
//  CustomerModelCo.swift
//  ObjectMapper-vs-Codable
//
//  Created by HongNhan on 11/17/20.
//

class CustomerModelCo: BaseModelCo {
    //var id: String? //(On BaseModelCo)
    var name: String?
    var company: CompanyModelCo?
    var address: AddressModelCo?


    private enum CodingKeys: String, CodingKey {
            case name
            case company
            case address
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(company, forKey: .company)
        try container.encodeIfPresent(address, forKey: .address)

        // must super encode if inheritance
        try super.encode(to: encoder)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Note: decode vs decodeIfPresent, decode with return error "The data couldn’t be read because it is missing." If data missing key and value.
        
        name = try container.decodeIfPresent(String.self, forKey: .name)
        company = try container.decodeIfPresent(CompanyModelCo.self, forKey: .company)
        address = try container.decodeIfPresent(AddressModelCo.self, forKey: .address)

        // must super init if inheritance
        try super.init(from: decoder)
    }
}
