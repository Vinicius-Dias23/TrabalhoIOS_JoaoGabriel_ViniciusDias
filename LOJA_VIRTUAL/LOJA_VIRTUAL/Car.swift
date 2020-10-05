//
//  Car.swift
//  Carros
//
//  Created by Wladmir  on 23/09/20.
//

import Foundation

struct Car: Codable {
    public let name, date: String
    public let value: Int
    public let brand, color, createdAt: String
    public let image: String
    
    enum CodingKeys: String, CodingKey {
        case name = "nome"
        case date = "data"
        case value = "valor"
        case brand = "marca"
        case color = "cor"
        case image
        case createdAt
    }
}
