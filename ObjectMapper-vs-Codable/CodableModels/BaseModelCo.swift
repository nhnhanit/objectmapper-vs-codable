//
//  BaseModelCo.swift
//  ObjectMapper-vs-Codable
//
//  Created by HongNhan on 11/18/20.
//

class BaseModelCo: Codable {
    var id: String?
    
//    private enum CodingKeys: String, CodingKey {
//            case id
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encodeIfPresent(id, forKey: .id)
//
//        try encode(to: encoder)
//    }
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        id = try container.decodeIfPresent(String.self, forKey: .id)
//    }
}
