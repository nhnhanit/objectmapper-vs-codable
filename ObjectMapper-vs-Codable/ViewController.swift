//
//  ViewController.swift
//  ObjectMapper-vs-Codable
//
//  Created by HongNhan on 11/17/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Document:
        //https://viblo.asia/p/swift-war-on-json-in-swift-objectmapper-vs-codable-E375zQoqlGW
        
    }

    @IBAction func objectMapperDidTap(_ sender: Any) {
        if let localData = DataUtility.sharedInstance.readMyJsonString() {
            DataUtility.sharedInstance.parseJsonDataToModel_viaObjectMapper(jsonData: localData)
        }
    }
    
    @IBAction func codableDidTap(_ sender: Any) {
//        if let localData = DataUtility.sharedInstance.readMyJsonString() {
//            DataUtility.sharedInstance.parseJsonDataToModel_viaCodable(jsonData: localData)
//        }
        
        if let localData = DataUtility.sharedInstance.readLocalFile(forName: "MyJsonData") {
            DataUtility.sharedInstance.parseJsonDataToModel_viaCodable(jsonData: localData)
        }
    }
}

