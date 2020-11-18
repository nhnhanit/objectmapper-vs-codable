//
//  DataUtility.swift
//  ObjectMapper-vs-Codable
//
//  Created by HongNhan on 11/18/20.
//

import Foundation
import ObjectMapper

private var _sharedDataUtility = DataUtility()

class DataUtility: NSObject {
    
    class var sharedInstance: DataUtility {
        return _sharedDataUtility
    }
    
    func readMyJsonString() -> Data? {
        let jsonString = """
                        {
                          "id": "123abc",
                          "name": "Sonic",
                          "address": {
                            "street": "345a Hoang Van Thu",
                            "zipcodeForAddress": "70000",
                            "city": "Ho Chi Minh",
                          },
                          "company": {
                            "name": "StageIT",
                            "catchPhrase": "acb"
                          }
                        }
                        """
    
        let jsonData = Data(jsonString.utf8)
        return jsonData
    }
    
    /* USAGE:
     if let localData = DataUtility.sharedInstance.readLocalFile(forName: "MyJsonData") {
         DataUtility.sharedInstance.parseJsonDataToModel_viaObjectMapper(jsonData: localData)
     }
     */
    
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }

    
    // From json string --> json data -> json object -> model
    func parseJsonDataToModel_viaObjectMapper(jsonData: Data) -> CustomerModel? {
        do {
            if let dict = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any] {
                
                if let parseModel: CustomerModel = Mapper<CustomerModel>().map(JSONObject: dict){
                    
                    print("=== ObjectMapper ===")
                    print("parseModelId =", parseModel.id ?? "..........")
                    print("name =", parseModel.name ?? "..........")
                    print("street =", parseModel.address?.street ?? "..........")
                    print("zipcode =", parseModel.address?.zipcode ?? "..........")
                    print("companyName =", parseModel.company?.name ?? "..........")
                    print("===================================")
                    
                    return parseModel
                }
            }
        }catch {
            print("parseJsonDataToModel_viaObjectMapper error = \(error.localizedDescription)")
        }
        
        return nil
    }
    
    func parseJsonDataToModel_viaCodable(jsonData: Data){
        do {
                    
            let decoder = JSONDecoder()
            let parseModelCo = try decoder.decode(CustomerModelCo.self, from: jsonData)
            
            print("=== Codable ===")
            print("parseModelCoId =", parseModelCo.id ?? "..........")
            print("name =", parseModelCo.name ?? "..........")
            print("companyName =", parseModelCo.company?.name ?? "..........")
            print("companyName =", parseModelCo.company?.name ?? "..........")
            print("street =", parseModelCo.address?.street ?? "..........")
            print("zipcode =", parseModelCo.address?.zipcode ?? "..........")
            print("city =", parseModelCo.address?.city ?? "..........")
            
            print("===================================")
            
            print(parseModelCo.format(options: .prettyPrinted))
            
        } catch let error {
            print("parseJsonDataToModel_viaCodable error = \(error.localizedDescription)")
        }
    }
}

extension Decodable where Self : Encodable {

    dynamic func format(options: JSONEncoder.OutputFormatting) -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = options
        do {
            let jsonData = try encoder.encode(self)
            if let jsonString = String(data: jsonData, encoding: .utf8) { return "\(jsonString)" }
        } catch {
            print("\(error.localizedDescription)")
        }
        return "nil"
    }
}
