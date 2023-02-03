//
//  ApiManager.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 10/03/2022.
//

import Foundation
import Alamofire

class ApiManager {
    static let shared = ApiManager()

    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).validate(statusCode: 200..<300).response { [weak self] response in
            completion(response.result)
            print(response.result)
        }
    }
}
