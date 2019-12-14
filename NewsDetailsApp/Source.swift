//
//  Source.swift
//  NewsDetailsApp
//
//  Created by SYDULU THAPPETLA on 14/12/19.
//  Copyright © 2019 SYDULU THAPPETLA. All rights reserved.
//

import Foundation
struct Source : Decodable {
    
    let id : AnyObject?
    let name : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id) as AnyObject
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
    
}
