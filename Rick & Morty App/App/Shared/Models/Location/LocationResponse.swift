//
//  LocationResponse.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 14/03/2022.
//

import Foundation

struct LocationResponse: Codable {
    var results = [Location]()
}
