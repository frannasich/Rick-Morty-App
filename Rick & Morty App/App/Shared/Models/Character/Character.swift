//
//  Character.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 10/03/2022.
//

import Foundation

struct Character: Codable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var gender: String
    var image: String
    var origin: Origin
    var location: LocationCharacter
}

struct Origin: Codable{
    var name: String
}

struct LocationCharacter: Codable{
    var name: String
}
